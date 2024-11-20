import express from "express";
import productRoute from "~/routes/ProductRoute";

const V1Route = express.Router();
V1Route.use("/products", productRoute);

export default V1Route;
