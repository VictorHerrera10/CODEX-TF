import { Test, TestingModule } from '@nestjs/testing';
import { TuuristService } from './tuurist.service';

describe('TuuristService', () => {
  let service: TuuristService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [TuuristService],
    }).compile();

    service = module.get<TuuristService>(TuuristService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
