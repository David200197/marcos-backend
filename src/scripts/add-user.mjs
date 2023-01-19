import { Logger, NotAcceptableException } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';
import { hash } from 'bcrypt';

import { input, inputSelect } from './helpers/input.mjs';
import { killProcess } from './helpers/kill-process.mjs';

const prisma = new PrismaClient();
const logger = new Logger();

const emailRegExp =
  /(?:(?:[\w`~!#$%^&*\-=+;:{}'|,?\/]+(?:(?:\.(?:"(?:\\?[\w`~!#$%^&*\-=+;:{}'|,?\/\.()<>\[\] @]|\\"|\\\\)*"|[\w`~!#$%^&*\-=+;:{}'|,?\/]+))*\.[\w`~!#$%^&*\-=+;:{}'|,?\/]+)?)|(?:"(?:\\?[\w`~!#$%^&*\-=+;:{}'|,?\/\.()<>\[\] @]|\\"|\\\\)+"))@(?:[a-zA-Z\d\-]+(?:\.[a-zA-Z\d\-]+)*|\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\])$/;
const passwordRegExp = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/;

const ADMIN = 'administrador';
const ARTIST = 'artista aficionado';
const RESP = 'responsable';

const advanceSelectOption = async (text, entities, property) => {
  const options = entities.map((_, index) => index + 1);
  const textSelect = entities.map(
    (entity, index) => `${index + 1}-${entity[property]}`,
  );

  const facultadSelectedIndex = await inputSelect(
    `${text} \n${textSelect.join('\n')}\n`,
    options,
  );
  return entities[facultadSelectedIndex - 1];
};

const addDataAdmin = async ({ user }) => {
  const administrador = await prisma.administrador.create({ data: {} });
  await prisma.usuario.update({
    where: {
      idUsuario: user.idUsuario,
    },
    data: {
      administradoridAdministrador: administrador.idAdministrador,
    },
  });
  logger.log('se agrego los datos del administrador');
};

const addDataArtist = async ({ user, manifestaciones, facultades }) => {
  const carrera = await input(
    'Introduzca la carrera a la que pertenece el usuario',
    {
      required: true,
    },
  );
  const activoAnswer = await inputSelect(
    'El usuario se encuentra activo en la universidad?',
    ['si', 'no'],
  );
  const activo = activoAnswer === 'si' ? true : false;
  let anno;
  if (activoAnswer === 'si') {
    while (true) {
      anno = +(await input('Introduzca el año que esta cursando el usuario', {
        required: true,
      }));
      if (isNaN(anno)) {
        Logger.error('su selección no es un numero');
        continue;
      }
      break;
    }
  }
  let premios;
  while (true) {
    premios = +(await input('Numero de premios del usuario', {
      required: true,
    }));
    if (isNaN(premios)) {
      Logger.error('su selección no es un numero');
      continue;
    }
    break;
  }

  const manifestacion = await advanceSelectOption(
    'Selecciona la manifestacion del artista',
    manifestaciones,
    'nombre',
  );

  const facultad = await advanceSelectOption(
    'Selecciona la facultad del artista',
    facultades,
    'nombre',
  );

  const artistaAficionado = await prisma.artistasaficionados.create({
    data: {
      carrera,
      activo,
      anno,
      premios,
      manifestacionidManifestacion: manifestacion.idManifestacion,
      facultadid: facultad.id,
    },
  });

  await prisma.usuario.update({
    where: {
      idUsuario: user.idUsuario,
    },
    data: {
      artistasAficionadosidArtista: artistaAficionado.idArtista,
    },
  });
  logger.log('se agrego los datos del artista aficionado');
};

const addDataResp = async ({ user, manifestaciones, facultades }) => {
  const procedencia = await input('Procedencia del usuario', {
    required: true,
  });
  let premios;
  while (true) {
    premios = +(await input('Numero de premios del usuario', {
      required: true,
    }));
    if (isNaN(premios)) {
      Logger.error('su selección no es un numero');
      continue;
    }
    break;
  }
  let numeroDeTelefono;
  while (true) {
    numeroDeTelefono = await input('Numero de telefono del usuario', {
      required: true,
    });
    if (numeroDeTelefono.length === '8') {
      Logger.error('su selección no es un numero');
      continue;
    }
    break;
  }

  const manifestacion = await advanceSelectOption(
    'Selecciona la manifestacion del artista',
    manifestaciones,
    'nombre',
  );

  const responsable = await prisma.responsable.create({
    data: {
      procedencia,
      premios,
      numeroDeTelefono,
      manifestacionidManifestacion2: manifestacion.idManifestacion,
    },
  });
  await prisma.usuario.update({
    where: {
      idUsuario: user.idUsuario,
    },
    data: {
      responsableidResponsable: responsable.idResponsable,
    },
  });
  logger.log('se agrego los datos del responsable');
};

const addDataRoleList = {
  [RESP]: addDataResp,
  [ADMIN]: addDataAdmin,
  [ARTIST]: addDataArtist,
};

const createRole = async () => {
  await prisma.role.create({ data: { tipo: ADMIN } });
  await prisma.role.create({ data: { tipo: ARTIST } });
  await prisma.role.create({ data: { tipo: RESP } });
  return await prisma.role.findMany();
};

const createManifestacion = async () => {
  await prisma.manifestacion.create({ data: { nombre: 'Literatura' } });
  await prisma.manifestacion.create({ data: { nombre: 'Artes Visuales' } });
  await prisma.manifestacion.create({ data: { nombre: 'Musica' } });
  await prisma.manifestacion.create({ data: { nombre: 'Danza' } });
  await prisma.manifestacion.create({ data: { nombre: 'Audiovisuales' } });
  await prisma.manifestacion.create({ data: { nombre: 'Artes Escénicas' } });
  return await prisma.manifestacion.findMany();
};

const createFacultad = async () => {
  await prisma.facultad.create({
    data: { nombre: 'Ciencias Sociales y Humanidades' },
  });
  await prisma.facultad.create({ data: { nombre: 'Ciencias Tecnicas' } });
  await prisma.facultad.create({ data: { nombre: 'Ciencias Económicas' } });
  await prisma.facultad.create({ data: { nombre: 'Ciencias Agropecuarias' } });
  await prisma.facultad.create({
    data: { nombre: 'Ciencias De La Cultura Física' },
  });
  await prisma.facultad.create({ data: { nombre: 'Industrial' } });
  await prisma.facultad.create({ data: { nombre: 'Idioma' } });
  await prisma.facultad.create({ data: { nombre: 'Educación' } });
  return await prisma.facultad.findMany();
};

async function bootstrap() {
  try {
    logger.log('empezando script: crear usuario');
    await prisma.$connect();

    let roles = await prisma.role.findMany();
    if (!roles.length) {
      roles = await createRole();
    }

    let manifestaciones = await prisma.manifestacion.findMany();
    if (!manifestaciones.length) {
      manifestaciones = await createManifestacion();
    }

    let facultades = await prisma.facultad.findMany();
    if (!facultades.length) {
      facultades = await createFacultad();
    }

    const nombre = await input('Introduzca el nombre del usuario', {
      required: true,
    });
    const apellido1 = await input('Introduzca el primer apellido del usuario', {
      required: true,
    });
    const apellido2 = await input(
      'Introduzca el segundo apellido del usuario',
      {
        required: true,
      },
    );
    let contrasena;
    while (true) {
      contrasena = await input('Introduzca la contraseña del usuario', {
        required: true,
      });
      if (!contrasena.match(passwordRegExp)) {
        logger.error(
          `la contraseña debe contener:
          -al menos 8 caracteres
          -al menos una letra mayúscula, una minúscula y un numero
          -al menos un caracter especial`,
        );
        continue;
      }
      break;
    }
    const hashedPassword = await hash(contrasena, 12);

    let correo;
    while (true) {
      correo = await input('Introduzca el correo del usuario', {
        required: true,
      });
      if (!correo.match(emailRegExp)) {
        logger.error('correo inválido');
        continue;
      }
      const user = await prisma.usuario.findUnique({ where: { correo } });
      if (user) {
        logger.error('El correo ya existe');
        continue;
      }
      break;
    }

    const role = await advanceSelectOption(
      'Selecciona la facultad del artista',
      roles,
      'tipo',
    );

    const addDataRole = addDataRoleList[role.tipo];

    const user = await prisma.usuario.create({
      data: {
        nombre,
        correo,
        contrasena: hashedPassword,
        roleid: role.id,
        apellido1,
        apellido2,
      },
    });
    logger.log('usuario creado');

    await addDataRole({ user, manifestaciones, facultades });

    await prisma.$disconnect();
  } catch (error) {
    logger.error(error);
  } finally {
    logger.log('script finalizado');
    killProcess();
  }
}
bootstrap();
