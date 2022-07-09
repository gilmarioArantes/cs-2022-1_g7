import { Result } from 'src/shared/result';
import { SchedulingDTO } from '../DTO';
export interface CreateSchedulingProps {
    user_id: string;
    service_id: string;
    date: string;
    is_canceled: boolean | undefined;
}
export interface SchedulingProps {
    id: string;
    user_id: string;
    service_id: string;
    date: Date;
    is_canceled: boolean | undefined;
}
export declare class Scheduling {
    protected props: SchedulingProps;
    constructor(props: SchedulingProps);
    get user_id(): string;
    get service_id(): string;
    get date(): Date;
    get is_canceled(): boolean | undefined;
    static validate(data: SchedulingProps): Result<SchedulingProps>;
    static create(data: CreateSchedulingProps): Result<Scheduling>;
    static build(data: SchedulingDTO): Result<Scheduling>;
    toDTO(): SchedulingDTO;
}
