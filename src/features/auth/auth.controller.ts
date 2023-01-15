import { Controller, Post, Body } from '@nestjs/common';
import { AuthService } from './auth.service';
import { LoginDto } from './dto/loginDto';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post('login')
  async login(@Body() loginDto: LoginDto) {
    const { accessToken, user } = await this.authService.login(loginDto);
    const { contrasena, ...userWithoutPassword } = user;
    return { user: userWithoutPassword, accessToken };
  }
}
