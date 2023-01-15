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

const addDataAdmin = async (user) => {
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

const addDataArtist = async (user) => {
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
  const artistaAficionado = await prisma.artistasaficionados.create({
    data: { carrera, activo, anno, premios },
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

const addDataResp = async (user) => {
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
  const responsable = await prisma.responsable.create({
    data: { procedencia, premios, numeroDeTelefono },
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

async function bootstrap() {
  try {
    await prisma.$connect();
    logger.log('empezando script: crear usuario');
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
      break;
    }

    let roles = await prisma.role.findMany();
    if (!roles.length) {
      roles = await createRole();
    }

    const options = roles.map((_, index) => index + 1);
    const textSelect = roles.map((role, index) => `${index + 1}-${role.tipo}`);

    const selectedIndex = await inputSelect(
      `Selecciona el rol del ususario \n${textSelect.join('\n')}\n`,
      options,
    );
    const role = roles[selectedIndex - 1];
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

    await addDataRole(user);

    await prisma.$disconnect();
  } catch (error) {
    logger.error(error);
  } finally {
    logger.log('script finalizado');
    killProcess();
  }
}
bootstrap();
