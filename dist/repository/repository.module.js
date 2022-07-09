"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.RepositoryModule = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const entity_1 = require("./entity");
const SchedulingRepository_1 = require("./SchedulingRepository");
const ServiceRepository_1 = require("./ServiceRepository");
const UserRepository_1 = require("./UserRepository");
let RepositoryModule = class RepositoryModule {
};
RepositoryModule = __decorate([
    (0, common_1.Global)(),
    (0, common_1.Module)({
        imports: [typeorm_1.TypeOrmModule.forFeature([entity_1.ORMUser, entity_1.ORMScheduling, entity_1.ORMService])],
        providers: [UserRepository_1.UserRepository, SchedulingRepository_1.SchedulingRepository, ServiceRepository_1.ServiceRepository],
        exports: [UserRepository_1.UserRepository, SchedulingRepository_1.SchedulingRepository, ServiceRepository_1.ServiceRepository],
    })
], RepositoryModule);
exports.RepositoryModule = RepositoryModule;
//# sourceMappingURL=repository.module.js.map