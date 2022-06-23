export class UtilValid {
  static isVarNotNulOrEmpty(validThat: any):boolean {
    return validThat !== undefined && validThat !== null && validThat != "";
  }
}
