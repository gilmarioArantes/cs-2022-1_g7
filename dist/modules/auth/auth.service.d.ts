import { UserService } from '../user';
export declare class AuthService {
    protected userService: UserService;
    constructor(userService: UserService);
    validateUser(email: string, pass: string): Promise<any>;
}
