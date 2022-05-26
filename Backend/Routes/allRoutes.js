import express from "express"
const app=express()
import allSquareData from "../Controllers/allAppointmentData.js"
import allProductData from "../Controllers/allCatalogData.js"
app.get("/",(req,res)=>{
    res.send("Tayyab doen")
})

app.get("/appointmentAllData",allSquareData.allAppointmentData)
app.get("/catalogAllData",allProductData.allCatalogData)
export default app;