import { Injectable } from '@nestjs/common';
import { CreateProvierDto } from './dto/create-provier.dto';
import { UpdateProvierDto } from './dto/update-provier.dto';

@Injectable()
export class ProvierService {
  create(createProvierDto: CreateProvierDto) {
    return 'This action adds a new provier';
  }

  findAll() {
    return `This action returns all provier`;
  }

  findOne(id: number) {
    return `This action returns a #${id} provier`;
  }

  update(id: number, updateProvierDto: UpdateProvierDto) {
    return `This action updates a #${id} provier`;
  }

  remove(id: number) {
    return `This action removes a #${id} provier`;
  }
}
