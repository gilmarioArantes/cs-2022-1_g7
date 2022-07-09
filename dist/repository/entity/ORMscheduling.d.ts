import { Scheduling } from 'src/entity';
export declare class ORMScheduling {
    id: string;
    user_id: string;
    service_id: string;
    date: Date;
    is_canceled?: boolean;
    static import(instance: Scheduling): ORMScheduling;
    export(): Scheduling;
}
