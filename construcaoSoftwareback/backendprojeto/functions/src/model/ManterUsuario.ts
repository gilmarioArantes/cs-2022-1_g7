/* eslint-disable @typescript-eslint/no-explicit-any */
/* eslint-disable max-len */

import {UtilValid} from "../util/utilValid";

/* eslint-disable require-jsdoc */
export class ManterUsuario {
    nome?:string;
    email?:string;
    dataNascimento?:string;
    sexo?:string;
    senha?:string;
    telefone?:string;
    id?:string;
    admin?:boolean;

    constructor(nome?: string, email?:string, senha?:string, id?:string,
        dataNascimento?:string, sexo?:string, telefone?:string, admin?:boolean) {
      this.nome = nome;
      this.email = email;
      this.senha = senha;
      this.dataNascimento = dataNascimento;
      this.sexo = sexo;
      this.telefone = telefone;
      this.admin = UtilValid.isVarNotNulOrEmpty(admin)? admin : false;
      this.id = id;
    }

    public isUsuarioValido(): boolean {
      return UtilValid.isVarNotNulOrEmpty(this.email) && UtilValid.isVarNotNulOrEmpty(this.senha) && UtilValid.isVarNotNulOrEmpty(this.dataNascimento) && UtilValid.isVarNotNulOrEmpty(this.nome) &&
      UtilValid.isVarNotNulOrEmpty(this.sexo) && UtilValid.isVarNotNulOrEmpty(this.telefone) && UtilValid.isVarNotNulOrEmpty(this.dataNascimento);
    }

    static toManterUsuario(json: any = {}): ManterUsuario {
      return new ManterUsuario(json.nome, json.email, json.senha, json.id, json.sexo, json.dataNascimento, json.telefone, json.admin);
    }


    public toJson(): any {
      return JSON.parse(JSON.stringify(this)); // da parse em todos os atributos e retorna em json
    }
}
