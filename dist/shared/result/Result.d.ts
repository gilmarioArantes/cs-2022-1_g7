export declare class Result<T = any> {
    isSuccess: boolean;
    isFailure: boolean;
    error: Error;
    private _value;
    protected constructor(value?: T, error?: Error);
    static ok<U>(value?: U): Result<U>;
    errorValue(): string;
    static fail(error: Error): Result;
    getValue(): T;
}
