import { Logger } from '@nestjs/common';

const logger = new Logger();

export const input = async (text, { required = false } = {}) => {
  while (true) {
    logger.log(`${text}:`);
    const value = await new Promise((resolve, reject) => {
      process.stdin.on('data', (data) => {
        resolve(data.toString().trim());
        return;
      });
    });
    if (required && !value) {
      logger.error(`this input cannot be null`);
      continue;
    }
    return value.trim().split(/\s+/).join(' ');
  }
};

export const inputSelect = async (text, options) => {
  while (true) {
    const select = await input(`${text} (${options.join('/')})`);
    if (!options.map((option) => `${option}`).includes(`${select}`)) {
      logger.error(`please, select the correct choose`);
      continue;
    }
    return select;
  }
};
