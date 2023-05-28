import { PartialType } from '@nestjs/mapped-types';
import { CreateTuuristDto } from './create-tuurist.dto';

export class UpdateTuuristDto extends PartialType(CreateTuuristDto) {}
