import { Test, TestingModule } from '@nestjs/testing';
import { ProvierService } from './provier.service';

describe('ProvierService', () => {
  let service: ProvierService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [ProvierService],
    }).compile();

    service = module.get<ProvierService>(ProvierService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
