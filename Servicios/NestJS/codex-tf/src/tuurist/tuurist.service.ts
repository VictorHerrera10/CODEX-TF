import { Injectable } from '@nestjs/common';
import { CreateTuuristDto } from './dto/create-tuurist.dto';
import { UpdateTuuristDto } from './dto/update-tuurist.dto';

@Injectable()
export class TuuristService {
  create(createTuuristDto: CreateTuuristDto) {
    return 'This action adds a new tuurist';
  }

  findAll() {
    return `This action returns all tuurist`;
  }

  findOne(id: number) {
    return `This action returns a #${id} tuurist`;
  }

  update(id: number, updateTuuristDto: UpdateTuuristDto) {
    return `This action updates a #${id} tuurist`;
  }

  remove(id: number) {
    return `This action removes a #${id} tuurist`;
  }
}
