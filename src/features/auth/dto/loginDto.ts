import { IsEmail, IsString, MinLength } from 'class-validator';

export class LoginDto {
  @IsEmail()
  @MinLength(1)
  correo: string;
  @IsString()
  @MinLength(1)
  contrasena: string;
}
