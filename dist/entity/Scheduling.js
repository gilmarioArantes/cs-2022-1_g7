"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Scheduling = void 0;
const Joi = require("joi");
const result_1 = require("../shared/result");
const uuid_1 = require("uuid");
class Scheduling {
    constructor(props) {
        this.props = props;
        this.props = props;
    }
    get user_id() {
        return this.props.user_id;
    }
    get service_id() {
        return this.props.service_id;
    }
    get date() {
        return this.props.date;
    }
    get is_canceled() {
        return this.props.is_canceled;
    }
    static validate(data) {
        const schedulingObject = {
            id: Joi.string().guid({ version: "uuidv4" }),
            user_id: Joi.string().required(),
            service_id: Joi.string().required(),
            date: Joi.object().instance(Date).required(),
            is_canceled: Joi.boolean().optional(),
        };
        const { value, error } = Joi.object(schedulingObject).unknown().validate(data);
        if (error) {
            return result_1.Result.fail(error);
        }
        return result_1.Result.ok(value);
    }
    static create(data) {
        const validated = this.validate(Object.assign(Object.assign({}, data), { id: (0, uuid_1.v4)(), date: new Date(data.date) }));
        if (validated.isFailure) {
            return result_1.Result.fail(validated.error);
        }
        return result_1.Result.ok(new Scheduling(validated.getValue()));
    }
    static build(data) {
        const validated = this.validate(Object.assign(Object.assign({}, data), { date: new Date(data.date) }));
        if (validated.isFailure) {
            return result_1.Result.fail(validated.error);
        }
        return result_1.Result.ok(new Scheduling(validated.getValue()));
    }
    toDTO() {
        return Object.assign(Object.assign({}, this.props), { date: this.props.date.toISOString() });
    }
}
exports.Scheduling = Scheduling;
//# sourceMappingURL=Scheduling.js.map