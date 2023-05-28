import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UsersModule } from './users/users.module';
import { ProvierModule } from './provier/provier.module';
import { TuuristModule } from './tuurist/tuurist.module';

@Module({
  imports: [UsersModule, ProvierModule, TuuristModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
