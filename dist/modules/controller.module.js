"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.controllerModule = void 0;
const common_1 = require("@nestjs/common");
const auth_controller_1 = require("./auth/auth.controller");
const user_1 = require("./user");
const service_1 = require("./service");
const scheduling_1 = require("./scheduling");
let controllerModule = class controllerModule {
};
controllerModule = __decorate([
    (0, common_1.Module)({
        imports: [user_1.UserModule, service_1.ServiceModule, scheduling_1.SchedulingModule, auth_controller_1.AuthController],
        providers: [],
    })
], controllerModule);
exports.controllerModule = controllerModule;
//# sourceMappingURL=controller.module.js.map