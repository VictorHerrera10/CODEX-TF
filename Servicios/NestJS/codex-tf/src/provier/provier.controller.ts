import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { ProvierService } from './provier.service';
import { CreateProvierDto } from './dto/create-provier.dto';
import { UpdateProvierDto } from './dto/update-provier.dto';

@Controller('provier')
export class ProvierController {
  constructor(private readonly provierService: ProvierService) {}

  @Post()
  create(@Body() createProvierDto: CreateProvierDto) {
    return this.provierService.create(createProvierDto);
  }

  @Get()
  findAll() {
    return this.provierService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.provierService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateProvierDto: UpdateProvierDto) {
    return this.provierService.update(+id, updateProvierDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.provierService.remove(+id);
  }
}
