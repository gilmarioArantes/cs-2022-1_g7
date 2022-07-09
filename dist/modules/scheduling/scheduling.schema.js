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
Object.defineProperty(exports, "__esModule", { value: true });
exports.SchedulingSchema = exports.BodyCreateOptions = void 0;
const swagger_1 = require("@nestjs/swagger");
class createSchedulingProps {
}
__decorate([
    (0, swagger_1.ApiProperty)({
        example: 'IF4562DA',
    }),
    __metadata("design:type", String)
], createSchedulingProps.prototype, "user_id", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        example: '45EGHN12',
    }),
    __metadata("design:type", String)
], createSchedulingProps.prototype, "service_id", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        example: '03/05/2001 13:20:22',
    }),
    __metadata("design:type", Date)
], createSchedulingProps.prototype, "date", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        example: false,
    }),
    __metadata("design:type", Boolean)
], createSchedulingProps.prototype, "is_canceled", void 0);
exports.BodyCreateOptions = {
    type: createSchedulingProps,
};
class SchedulingSchema {
}
exports.SchedulingSchema = SchedulingSchema;
//# sourceMappingURL=scheduling.schema.js.map