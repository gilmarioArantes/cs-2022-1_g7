import { User } from '../entity';
import { Repository } from 'typeorm';
import { ORMUser } from './entity';
import { Result } from 'src/shared/result';
export declare class UserRepository {
    private readonly repository;
    constructor(repository: Repository<ORMUser>);
    save(data: User): Promise<Result<void>>;
    all(): Promise<Result<User[]>>;
    findByEmail(email: string): Promise<Result<User>>;
}
