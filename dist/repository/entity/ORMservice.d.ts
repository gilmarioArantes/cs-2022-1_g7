import { Service } from 'src/entity';
export declare class ORMService {
    id: string;
    customer_id: string;
    name: string;
    price: string;
    description: string;
    static import(instance: Service): ORMService;
    export(): Service;
}
