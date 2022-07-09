import { Service } from '../../entity';
import { Result } from 'src/shared/result';
import { ServiceRepository } from '../../repository';
export declare class ServiceService {
    protected readonly serviceRepository: ServiceRepository;
    constructor(serviceRepository: ServiceRepository);
    getAll(): Promise<Result<Service[]>>;
    findByEmail(id: string): Promise<Result<Service>>;
}
