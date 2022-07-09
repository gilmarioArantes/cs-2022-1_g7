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
var ORMService_1;
Object.defineProperty(exports, "__esModule", { value: true });
exports.ORMService = void 0;
const entity_1 = require("../../entity");
const typeorm_1 = require("typeorm");
let ORMService = ORMService_1 = class ORMService {
    static import(instance) {
        const entity = new ORMService_1();
        entity.customer_id = instance.customer_id;
        entity.name = instance.name;
        entity.price = instance.price;
        entity.description = instance.description;
        return entity;
    }
    export() {
        const retrivedData = {
            id: this.id,
            customer_id: this.customer_id,
            name: this.name,
            price: this.price,
            description: this.description,
        };
        return new entity_1.Service(retrivedData);
    }
};
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)('uuid'),
    __metadata("design:type", String)
], ORMService.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.Column)({ type: 'varchar', length: 64, nullable: false, unique: true }),
    __metadata("design:type", String)
], ORMService.prototype, "customer_id", void 0);
__decorate([
    (0, typeorm_1.Column)({ type: 'varchar', length: 64, nullable: false }),
    __metadata("design:type", String)
], ORMService.prototype, "name", void 0);
__decorate([
    (0, typeorm_1.Column)({ type: 'varchar', length: 64, nullable: false }),
    __metadata("design:type", String)
], ORMService.prototype, "price", void 0);
__decorate([
    (0, typeorm_1.Column)({ type: 'varchar', length: 64, nullable: false }),
    __metadata("design:type", String)
], ORMService.prototype, "description", void 0);
ORMService = ORMService_1 = __decorate([
    (0, typeorm_1.Entity)('service')
], ORMService);
exports.ORMService = ORMService;
//# sourceMappingURL=ORMservice.js.map