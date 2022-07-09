import { Result } from 'src/shared/result';
export interface CreateServiceProps {
    customer_id: string;
    name: string;
    price: string;
    description: string;
}
interface ServiceProps extends CreateServiceProps {
    id: string;
}
export declare class Service {
    protected props: ServiceProps;
    constructor(props: ServiceProps);
    get customer_id(): string;
    get name(): string;
    get price(): string;
    get description(): string;
    static validate(data: ServiceProps): Result<ServiceProps>;
}
export {};
