import { IsEmail } from 'class-validator';

export class FindByDto {
  @IsEmail()
  correo: string;
}
