
//import app from "./app"
import "dotenv/config"
import express from "express"
import route from "./route/route"
const app =express()

const server =app
const PORT =process.env.PORT || 3001
app.use(express.json())
app.use(route)


server.listen(PORT,()=>{
    console.log(`server is running on port ${PORT}`)
})
