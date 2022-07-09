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
var ORMScheduling_1;
Object.defineProperty(exports, "__esModule", { value: true });
exports.ORMScheduling = void 0;
const entity_1 = require("../../entity");
const typeorm_1 = require("typeorm");
let ORMScheduling = ORMScheduling_1 = class ORMScheduling {
    static import(instance) {
        const entity = new ORMScheduling_1();
        entity.user_id = instance.user_id;
        entity.service_id = instance.service_id;
        entity.date = instance.date;
        entity.is_canceled = instance.is_canceled;
        return entity;
    }
    export() {
        const retrivedData = {
            id: this.id,
            user_id: this.user_id,
            service_id: this.service_id,
            date: this.date.toISOString(),
            is_canceled: this.is_canceled,
        };
        const buildScheduling = entity_1.Scheduling.build(retrivedData);
        if (buildScheduling.isFailure) {
            throw buildScheduling.error;
        }
        return buildScheduling.getValue();
    }
};
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)('uuid'),
    __metadata("design:type", String)
], ORMScheduling.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.Column)({ type: 'varchar', length: 64, nullable: false }),
    __metadata("design:type", String)
], ORMScheduling.prototype, "user_id", void 0);
__decorate([
    (0, typeorm_1.Column)({ type: 'varchar', length: 64, nullable: false }),
    __metadata("design:type", String)
], ORMScheduling.prototype, "service_id", void 0);
__decorate([
    (0, typeorm_1.Column)({ type: 'timestamp', nullable: false }),
    __metadata("design:type", Date)
], ORMScheduling.prototype, "date", void 0);
__decorate([
    (0, typeorm_1.Column)({ type: 'boolean', nullable: false }),
    __metadata("design:type", Boolean)
], ORMScheduling.prototype, "is_canceled", void 0);
ORMScheduling = ORMScheduling_1 = __decorate([
    (0, typeorm_1.Entity)('scheduling')
], ORMScheduling);
exports.ORMScheduling = ORMScheduling;
//# sourceMappingURL=ORMscheduling.js.map