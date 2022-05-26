import express from "express"
const app=express();
import allRoutes from "./Routes/allRoutes.js"
app.use("/",allRoutes)

app.listen(3000,()=>{
    console.log("Connected")
})