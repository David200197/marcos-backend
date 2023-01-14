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

const createRole = async () => {
  await prisma.role.create({ data: { tipo: 'administrador' } });
  await prisma.role.create({ data: { tipo: 'artista aficionado' } });
  await prisma.role.create({ data: { tipo: 'responsable' } });
  return await prisma.role.findMany();
};

async function bootstrap() {
  try {
    await prisma.$connect();
    logger.log('empezando script: crear usuario');
    const nombre = await input(
      'Introduzca el nombre y los apellidos del usuario (separado por espacios)',
      {
        required: true,
      },
    );
    if (nombre.split(' ').length !== 3)
      throw new NotAcceptableException('Debe ser el nombre y 2 apellidos');

    const contrasena = await input('Introduzca la contraseña del usuario', {
      required: true,
    });
    if (!contrasena.match(passwordRegExp))
      throw new NotAcceptableException(
        `la contraseña debe contener:
        -al menos 8 caracteres
        -al menos una letra mayúscula, una minúscula y un numero
        -al menos un caracter especial`,
      );
    const hashedPassword = await hash(contrasena, 12);

    const correo = await input('Introduzca el correo del usuario', {
      required: true,
    });
    if (!correo.match(emailRegExp))
      throw new NotAcceptableException('correo inválido');

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

    await prisma.usuario.create({
      data: { nombre, correo, contrasena: hashedPassword, roleid: role.id },
    });
    logger.log('usuario creado');

    await prisma.$disconnect();
  } catch (error) {
    logger.error(error);
  } finally {
    logger.log('script finalizado');
    killProcess();
  }
}
bootstrap();
