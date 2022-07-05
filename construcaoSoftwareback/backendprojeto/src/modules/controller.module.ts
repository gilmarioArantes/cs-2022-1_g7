import { Module } from '@nestjs/common';
import { AuthController } from './auth/auth.controller';
import { UserModule } from './user';
import {ServiceModule} from './service'

@Module({
  imports: [UserModule, ServiceModule, AuthController],
  providers: [],
})
export class controllerModule {}
