import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import * as express from "express";
import {UsuarioService} from "./services/UsuarioService";


admin.initializeApp(functions.config().firebase);
const db = admin.firestore();

const usuarioExpress = express();
const usuarioService = new UsuarioService(db);


usuarioExpress.get("/cadastrarUsuario", (req, res) => usuarioService
    .cadastrarUsuario(req, res));
usuarioExpress.get("/logarUsuario", (req, res) => usuarioService
    .logarUsuario(req, res));
export const usuario = functions.https.onRequest(usuarioExpress);
