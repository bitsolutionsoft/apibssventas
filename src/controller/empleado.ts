import { Request, Response } from "express";
import { prisma } from "../../lib/prisma";

class Empleado {
    constructor(){}

    async getEmpleado(req:Request,res:Response){
        try {
            const empleado=await prisma.empleado.findMany();
            if(empleado.length > 0){
                return res.send({data:empleado}).status(200);
            }
            return res.send({message:"Not Found"}).status(404);
        } catch (error) {
            return res.send({message:"Algo salio mal en el servidor",error:error}).status(500)
        }

    }
    async getEmpleadoById(req:Request,res:Response){
        try {
            const id=req.params.id
            const empleado=await prisma.empleado.findUnique(
                {
                    where:{
                        idempleado:Number(id)
                    }
                }
            );
            if(empleado){
                return res.send({data:empleado}).status(200);
            }
            return res.send({message:"Not Found"}).status(404);
        } catch (error) {
            return res.send({message:"Algo salio mal en el servidor",error:error}).status(500)
        }

    }
}

export default new Empleado()