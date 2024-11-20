import express from "express";
import V1Route from "./src/start/route";

const port = process.env.PORT || 3000;

const app = express();
app.use(express.json());

app.use("/api/v1", V1Route);

app.listen(port, () => {
  console.log(`Server started on port ${port}`);
});
