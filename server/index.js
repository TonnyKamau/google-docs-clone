const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");
const app = express();
const cors =require('cors');

app.use(cors());
app.use(express.json());
app.use(authRouter);
const PORT = process.env.PORT | 3001;
app.listen(PORT, "0.0.0.0", () => {
  console.log(`app connected at ${PORT}`);
});

mongoose
  .connect(
    "mongodb+srv://aintmaniac:M8080aint@cluster0.pnfi0td.mongodb.net/?retryWrites=true&w=majority"
  )
  .then(() => {
    console.log("connection successful");
  })
  .catch((error) => {
    console.log(error);
  });
