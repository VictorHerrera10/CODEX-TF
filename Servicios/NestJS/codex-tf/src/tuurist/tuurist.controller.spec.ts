import { Test, TestingModule } from '@nestjs/testing';
import { TuuristController } from './tuurist.controller';
import { TuuristService } from './tuurist.service';

describe('TuuristController', () => {
  let controller: TuuristController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [TuuristController],
      providers: [TuuristService],
    }).compile();

    controller = module.get<TuuristController>(TuuristController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
