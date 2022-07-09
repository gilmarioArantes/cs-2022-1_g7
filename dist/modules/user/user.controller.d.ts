import { Response } from 'express';
import { CreateUserProps } from 'src/entity';
import { UserService } from './user.service';
export declare class UserController {
    private readonly userService;
    constructor(userService: UserService);
    all(res: Response): Promise<void>;
    create(body: CreateUserProps, res: Response): Promise<void>;
}
