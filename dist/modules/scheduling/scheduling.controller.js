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
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.SchedulingController = void 0;
const common_1 = require("@nestjs/common");
const swagger_1 = require("@nestjs/swagger");
const scheduling_schema_1 = require("./scheduling.schema");
const scheduling_service_1 = require("./scheduling.service");
let SchedulingController = class SchedulingController {
    constructor(schedulingService) {
        this.schedulingService = schedulingService;
    }
    async all(res) {
        const result = await this.schedulingService.getAll();
        if (result.isFailure) {
            res.status(400).send(result.errorValue());
            return;
        }
        let scheduling = result.getValue();
        let schedulingDTO = [];
        for (let schedule of scheduling) {
            schedulingDTO.push(schedule.toDTO());
        }
        res.status(200).send(schedulingDTO);
    }
    async create(body, res) {
        const result = await this.schedulingService.createAndSave(body);
        if (result.isFailure) {
            res.status(400).send(result.errorValue());
            return;
        }
        const schedule = result.getValue();
        res.status(200).send(schedule.toDTO());
    }
};
__decorate([
    (0, swagger_1.ApiOperation)({ summary: 'List all Schedule' }),
    (0, common_1.Get)(),
    __param(0, (0, common_1.Res)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", Promise)
], SchedulingController.prototype, "all", null);
__decorate([
    (0, swagger_1.ApiOperation)({ summary: 'Create a Schedule' }),
    (0, swagger_1.ApiBody)(scheduling_schema_1.BodyCreateOptions),
    (0, common_1.Post)(),
    __param(0, (0, common_1.Body)()),
    __param(1, (0, common_1.Res)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object, Object]),
    __metadata("design:returntype", Promise)
], SchedulingController.prototype, "create", null);
SchedulingController = __decorate([
    (0, swagger_1.ApiTags)('scheduling'),
    (0, common_1.Controller)('scheduling'),
    __metadata("design:paramtypes", [scheduling_service_1.SchedulingService])
], SchedulingController);
exports.SchedulingController = SchedulingController;
//# sourceMappingURL=scheduling.controller.js.map