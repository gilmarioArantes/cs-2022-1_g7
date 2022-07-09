import { Response } from 'express';
import { CreateSchedulingProps } from 'src/entity';
import { SchedulingService } from './scheduling.service';
export declare class SchedulingController {
    private readonly schedulingService;
    constructor(schedulingService: SchedulingService);
    all(res: Response): Promise<void>;
    create(body: CreateSchedulingProps, res: Response): Promise<void>;
}
