import { Injectable } from '@nestjs/common';
import { NotFoundException } from '@nestjs/common';
import { PrismaService } from 'src/common/prisma/prisma.service';
import { CreateUserDto } from './dto/create-user.dto';
import { FindByDto } from './dto/find-by-dto';
import { UpdateUserDto } from './dto/update-user.dto';

@Injectable()
export class UserService {
  private findInclude = {
    role: true,
    administrador: true,
    artistasaficionados: {
      include: {
        responsable: true,
        manifestacion: true,
        facultad: true,
      },
    },
    responsable: { include: { manifestacion: true } },
  };
  constructor(private readonly prismaService: PrismaService) {}
  create(createUserDto: CreateUserDto) {
    return 'This action adds a new user';
  }

  findAll() {
    return `This action returns all user`;
  }

  async findOne(id: string) {
    const user = await this.prismaService.usuario.findUnique({
      where: { idUsuario: id },
      include: this.findInclude,
    });
    if (!user) {
      throw new NotFoundException('usuario no encontrado');
    }
    return user;
  }

  async findBy({ correo }: FindByDto) {
    const user = await this.prismaService.usuario.findUnique({
      where: { correo },
      include: this.findInclude,
    });
    if (!user) {
      throw new NotFoundException('usuario no encontrado');
    }
    return user;
  }

  update(id: string, updateUserDto: UpdateUserDto) {
    return `This action updates a #${id} user`;
  }

  remove(id: string) {
    return `This action removes a #${id} user`;
  }
}
