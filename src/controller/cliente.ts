import { Response,Request } from "express";
import {prisma} from "../../lib/prisma"

class Cliente{
constructor(){}

async getCliente(req:Request,res:Response){
try {
   const cliente =await prisma.cliente.findMany({
    include:{
        factura:true
    }
   }) 
   
   if(cliente.length > 0){
    res.send({data:cliente}).status(200)
    return
   }
   res.send({message:"No encontro los registro"}).status(404);

} catch (error) {
    res.send().status(500)
}

}

}
export default new Cliente()


