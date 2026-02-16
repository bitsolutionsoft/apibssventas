import express, { Request,Response } from "express";
import cliente from "../controller/cliente"
import empleado from "../controller/empleado";

const route=express.Router();
 


 route.get("/",(req,res)=>{
    res.send({message:"pagina inicial"})
 })

 route.get("/empleado",empleado.getEmpleado)
 route.get("/empleado/:id",empleado.getEmpleadoById)

 route.get("/cliente",cliente.getCliente)
 

 export default route;
 