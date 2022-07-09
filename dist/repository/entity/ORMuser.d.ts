import { User } from 'src/entity';
export declare class ORMUser {
    id: string;
    name: string;
    email: string;
    password: string;
    birth: Date;
    gender?: string;
    phone: string;
    admin?: boolean;
    static import(instance: User): ORMUser;
    export(): User;
}
