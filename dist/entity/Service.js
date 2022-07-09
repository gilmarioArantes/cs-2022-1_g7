"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Service = void 0;
const Joi = require("joi");
const result_1 = require("../shared/result");
class Service {
    constructor(props) {
        this.props = props;
        this.props = props;
    }
    get customer_id() {
        return this.props.customer_id;
    }
    get name() {
        return this.props.name;
    }
    get price() {
        return this.props.price;
    }
    get description() {
        return this.props.description;
    }
    static validate(data) {
        const serviceObject = {
            id: Joi.string().guid({ version: "uuidv4" }),
            customer_id: Joi.string().required(),
            name: Joi.string().required(),
            price: Joi.string().required(),
            description: Joi.string().required(),
        };
        const { value, error } = Joi.object(serviceObject).unknown().validate(data);
        if (error) {
            return result_1.Result.fail(error);
        }
        return result_1.Result.ok(value);
    }
}
exports.Service = Service;
//# sourceMappingURL=Service.js.map