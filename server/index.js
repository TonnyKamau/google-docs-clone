const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");
const documentRouter = require("./routes/document");
const app = express();
const http = require("http");
const cors = require("cors");

app.use(cors());
app.use(express.json());
app.use(authRouter);
app.use(documentRouter);
var server = http.createServer(app);
var io = require("socket.io")(server);
const PORT = process.env.PORT | 3001;

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

io.on("connection", (socket) => {
  socket.on("join", (documentId) => {
    socket.join(documentId);
    console.log("joined");
  });
});
server.listen(PORT, "0.0.0.0", () => {
  console.log(`app connected at ${PORT}`);
});
