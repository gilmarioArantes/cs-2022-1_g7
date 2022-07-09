"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var ORMUser_1;
Object.defineProperty(exports, "__esModule", { value: true });
exports.ORMUser = void 0;
const entity_1 = require("../../entity");
const typeorm_1 = require("typeorm");
let ORMUser = ORMUser_1 = class ORMUser {
    static import(instance) {
        const entity = new ORMUser_1();
        entity.name = instance.name;
        entity.email = instance.email;
        entity.password = instance.password;
        entity.birth = instance.birth;
        entity.gender = instance.gender;
        entity.phone = instance.phone;
        entity.admin = instance.admin;
        return entity;
    }
    export() {
        const retrivedData = {
            id: this.id,
            name: this.name,
            email: this.email,
            password: this.password,
            birth: this.birth.toISOString(),
            gender: this.gender,
            phone: this.phone,
            admin: this.admin,
        };
        const buildUser = entity_1.User.build(retrivedData);
        if (buildUser.isFailure) {
            throw buildUser.error;
        }
        return buildUser.getValue();
    }
};
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)('uuid'),
    __metadata("design:type", String)
], ORMUser.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.Column)({ type: 'varchar', length: 64, nullable: false }),
    __metadata("design:type", String)
], ORMUser.prototype, "name", void 0);
__decorate([
    (0, typeorm_1.Column)({ type: 'varchar', length: 64, nullable: false, unique: true }),
    __metadata("design:type", String)
], ORMUser.prototype, "email", void 0);
__decorate([
    (0, typeorm_1.Column)({ type: 'varchar', length: 64, nullable: false }),
    __metadata("design:type", String)
], ORMUser.prototype, "password", void 0);
__decorate([
    (0, typeorm_1.Column)({ type: 'timestamp', nullable: false }),
    __metadata("design:type", Date)
], ORMUser.prototype, "birth", void 0);
__decorate([
    (0, typeorm_1.Column)({ type: 'varchar', length: 64, nullable: true }),
    __metadata("design:type", String)
], ORMUser.prototype, "gender", void 0);
__decorate([
    (0, typeorm_1.Column)({ type: 'varchar', length: 64, nullable: false }),
    __metadata("design:type", String)
], ORMUser.prototype, "phone", void 0);
__decorate([
    (0, typeorm_1.Column)({ type: 'boolean', nullable: true }),
    __metadata("design:type", Boolean)
], ORMUser.prototype, "admin", void 0);
ORMUser = ORMUser_1 = __decorate([
    (0, typeorm_1.Entity)('user')
], ORMUser);
exports.ORMUser = ORMUser;
//# sourceMappingURL=ORMuser.js.map