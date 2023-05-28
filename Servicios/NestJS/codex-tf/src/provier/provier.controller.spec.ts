import { Test, TestingModule } from '@nestjs/testing';
import { ProvierController } from './provier.controller';
import { ProvierService } from './provier.service';

describe('ProvierController', () => {
  let controller: ProvierController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [ProvierController],
      providers: [ProvierService],
    }).compile();

    controller = module.get<ProvierController>(ProvierController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
