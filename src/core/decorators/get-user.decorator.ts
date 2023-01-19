import { createParamDecorator, ExecutionContext } from '@nestjs/common';

export type LoggedUser = { userId: string };
export const GetUser = createParamDecorator(
  (data, ctx: ExecutionContext): LoggedUser => {
    const req = ctx.switchToHttp().getRequest();
    return req.user;
  },
);
