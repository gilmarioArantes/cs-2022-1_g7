import { CreateUserProps, User } from '../../entity';
import { Result } from 'src/shared/result';
import { UserRepository } from '../../repository';
export declare class UserService {
    protected readonly userRepository: UserRepository;
    constructor(userRepository: UserRepository);
    createAndSave(data: CreateUserProps): Promise<Result<User>>;
    getAll(): Promise<Result<User[]>>;
    findByEmail(email: string): Promise<Result<User>>;
}
