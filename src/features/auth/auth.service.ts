import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt/dist';
import { UserService } from '../user/user.service';
import { LoginDto } from './dto/loginDto';
import { compare } from 'bcrypt';
import { UnauthorizedException } from '@nestjs/common';

@Injectable()
export class AuthService {
  constructor(
    private readonly jwtService: JwtService,
    private readonly userService: UserService,
  ) {}
  async login({ contrasena, correo }: LoginDto) {
    const user = await this.userService.findBy({ correo }).catch((error) => {
      if (error.status === 404)
        throw new UnauthorizedException('usuario no autorizado');
      throw error;
    });
    if (!user) throw new UnauthorizedException('usuario no autorizado');
    const isValid = await compare(contrasena, user.contrasena);
    if (!isValid) throw new UnauthorizedException('usuario no autorizado');
    const accessToken = await this.jwtService.signAsync({
      userId: user.idUsuario,
    });
    return { user, accessToken };
  }
}
