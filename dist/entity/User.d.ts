import { Result } from 'src/shared/result';
import { UserDTO } from '../DTO';
export interface CreateUserProps {
    name: string;
    email: string;
    password: string;
    birth: string;
    gender: string | undefined;
    phone: string;
    admin: boolean | undefined;
}
export interface UserProps {
    id: string;
    name: string;
    email: string;
    password: string;
    birth: Date;
    gender: string | undefined;
    phone: string;
    admin: boolean | undefined;
}
export declare class User {
    protected props: UserProps;
    constructor(props: UserProps);
    get name(): string;
    get email(): string;
    get password(): string;
    get birth(): Date;
    get gender(): string | undefined;
    get phone(): string;
    get admin(): boolean | undefined;
    static validate(data: UserProps): Result<UserProps>;
    static create(data: CreateUserProps): Result<User>;
    static build(data: UserDTO): Result<User>;
    toDTO(): UserDTO;
}
