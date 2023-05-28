import { Module } from '@nestjs/common';
import { ProvierService } from './provier.service';
import { ProvierController } from './provier.controller';

@Module({
  controllers: [ProvierController],
  providers: [ProvierService]
})
export class ProvierModule {}
