import { Service } from '../entity';
import { Repository } from 'typeorm';
import { ORMService } from './entity';
import { Result } from 'src/shared/result';
export declare class ServiceRepository {
    private readonly repository;
    constructor(repository: Repository<ORMService>);
    save(data: Service): Promise<Result<void>>;
    all(): Promise<Result<Service[]>>;
    findById(id: string): Promise<Result<Service>>;
}
