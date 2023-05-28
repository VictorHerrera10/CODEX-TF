import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { TuuristService } from './tuurist.service';
import { CreateTuuristDto } from './dto/create-tuurist.dto';
import { UpdateTuuristDto } from './dto/update-tuurist.dto';

@Controller('tuurist')
export class TuuristController {
  constructor(private readonly tuuristService: TuuristService) {}

  @Post()
  create(@Body() createTuuristDto: CreateTuuristDto) {
    return this.tuuristService.create(createTuuristDto);
  }

  @Get()
  findAll() {
    return this.tuuristService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.tuuristService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateTuuristDto: UpdateTuuristDto) {
    return this.tuuristService.update(+id, updateTuuristDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.tuuristService.remove(+id);
  }
}
