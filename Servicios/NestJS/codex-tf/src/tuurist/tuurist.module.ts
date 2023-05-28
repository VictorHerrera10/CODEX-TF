import { Module } from '@nestjs/common';
import { TuuristService } from './tuurist.service';
import { TuuristController } from './tuurist.controller';

@Module({
  controllers: [TuuristController],
  providers: [TuuristService]
})
export class TuuristModule {}
