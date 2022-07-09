import { CreateSchedulingProps, Scheduling } from '../../entity';
import { Result } from 'src/shared/result';
import { SchedulingRepository } from '../../repository';
export declare class SchedulingService {
    protected readonly schedulingRepository: SchedulingRepository;
    constructor(schedulingRepository: SchedulingRepository);
    createAndSave(data: CreateSchedulingProps): Promise<Result<Scheduling>>;
    getAll(): Promise<Result<Scheduling[]>>;
}
