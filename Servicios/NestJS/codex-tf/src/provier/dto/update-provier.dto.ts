import { PartialType } from '@nestjs/mapped-types';
import { CreateProvierDto } from './create-provier.dto';

export class UpdateProvierDto extends PartialType(CreateProvierDto) {}
