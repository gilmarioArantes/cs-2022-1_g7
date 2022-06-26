import { Module } from '@nestjs/common';
import { AuthController } from './auth/auth.controller';
import { UserModule } from './user';

@Module({
  imports: [UserModule, AuthController],
  providers: [],
})
export class controllerModule {}
