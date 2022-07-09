"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Result = void 0;
class Result {
    constructor(value, error) {
        this.isSuccess = error ? false : true;
        this.isFailure = !this.isSuccess;
        this.error = error || new Error("Unknown error");
        this._value = value;
    }
    static ok(value) {
        return new Result(value);
    }
    errorValue() {
        return this.error.message;
    }
    static fail(error) {
        return new Result(undefined, error);
    }
    getValue() {
        if (!this.isSuccess) {
            throw new Error("Can't get the value of an error result. Use 'errorValue' instead.");
        }
        return this._value;
    }
}
exports.Result = Result;
//# sourceMappingURL=Result.js.map