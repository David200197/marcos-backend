import { IsEmail, IsString } from 'class-validator';

export class LoginDto {
  @IsEmail()
  correo: string;
  @IsString()
  contrasena: string;
}
