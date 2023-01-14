import { createParamDecorator, ExecutionContext } from '@nestjs/common';

export const GetUser = createParamDecorator(
  (data, ctx: ExecutionContext): { userId: string } => {
    const req = ctx.switchToHttp().getRequest();
    return req.user;
  },
);
