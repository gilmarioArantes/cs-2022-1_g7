import { Scheduling } from '../entity';
import { Repository } from 'typeorm';
import { ORMScheduling } from './entity';
import { Result } from 'src/shared/result';
export declare class SchedulingRepository {
    private readonly repository;
    constructor(repository: Repository<ORMScheduling>);
    save(data: Scheduling): Promise<Result<void>>;
    all(): Promise<Result<Scheduling[]>>;
}
