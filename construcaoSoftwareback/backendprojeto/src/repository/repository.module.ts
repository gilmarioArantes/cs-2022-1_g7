import { Global, Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ORMUser } from './entity';
import { UserRepository } from './UserRepository';

@Global()
@Module({
  imports: [TypeOrmModule.forFeature([ORMUser])],
  providers: [UserRepository],
  exports: [UserRepository],
})
export class RepositoryModule {}
