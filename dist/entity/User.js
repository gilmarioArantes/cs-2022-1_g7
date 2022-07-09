"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.User = void 0;
const Joi = require("joi");
const result_1 = require("../shared/result");
const uuid_1 = require("uuid");
class User {
    constructor(props) {
        this.props = props;
        this.props = props;
    }
    get name() {
        return this.props.name;
    }
    get email() {
        return this.props.email;
    }
    get password() {
        return this.props.password;
    }
    get birth() {
        return this.props.birth;
    }
    get gender() {
        return this.props.gender;
    }
    get phone() {
        return this.props.phone;
    }
    get admin() {
        return this.props.admin;
    }
    static validate(data) {
        const userObject = {
            id: Joi.string().guid({ version: "uuidv4" }),
            name: Joi.string().required(),
            email: Joi.string().email().required(),
            password: Joi.string().required(),
            birth: Joi.object().instance(Date).required(),
            gender: Joi.string().optional(),
            phone: Joi.string().required(),
            admin: Joi.boolean().optional(),
        };
        const { value, error } = Joi.object(userObject).unknown().validate(data);
        if (error) {
            return result_1.Result.fail(error);
        }
        return result_1.Result.ok(value);
    }
    static create(data) {
        const validated = this.validate(Object.assign(Object.assign({}, data), { id: (0, uuid_1.v4)(), birth: new Date(data.birth) }));
        if (validated.isFailure) {
            return result_1.Result.fail(validated.error);
        }
        return result_1.Result.ok(new User(validated.getValue()));
    }
    static build(data) {
        const validated = this.validate(Object.assign(Object.assign({}, data), { birth: new Date(data.birth) }));
        if (validated.isFailure) {
            return result_1.Result.fail(validated.error);
        }
        return result_1.Result.ok(new User(validated.getValue()));
    }
    toDTO() {
        return Object.assign(Object.assign({}, this.props), { birth: this.props.birth.toISOString() });
    }
}
exports.User = User;
//# sourceMappingURL=User.js.map