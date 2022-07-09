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
exports.UserSchema = exports.BodyCreateOptions = void 0;
const swagger_1 = require("@nestjs/swagger");
class createUserProps {
}
__decorate([
    (0, swagger_1.ApiProperty)({
        example: 'Name',
    }),
    __metadata("design:type", String)
], createUserProps.prototype, "name", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        example: 'teste@gmail.com',
    }),
    __metadata("design:type", String)
], createUserProps.prototype, "email", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        example: 'KJK55hf854dds',
    }),
    __metadata("design:type", String)
], createUserProps.prototype, "password", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        example: '03/05/2001',
    }),
    __metadata("design:type", Date)
], createUserProps.prototype, "birth", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        example: 'male',
        required: false,
    }),
    __metadata("design:type", String)
], createUserProps.prototype, "gender", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        example: '99999999999',
    }),
    __metadata("design:type", String)
], createUserProps.prototype, "phone", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        example: true,
        required: false,
    }),
    __metadata("design:type", Boolean)
], createUserProps.prototype, "admin", void 0);
exports.BodyCreateOptions = {
    type: createUserProps,
};
class UserSchema {
}
exports.UserSchema = UserSchema;
//# sourceMappingURL=user.schema.js.map