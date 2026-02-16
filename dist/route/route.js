"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const route = express_1.default.Router();
route.get("/", (req, res) => {
    res.send({ message: "bienvenido a la apo rest on typescript" });
});
route.get("/index", (req, res) => {
    res.send({ message: "pagina inicial" });
});
exports.default = route;
