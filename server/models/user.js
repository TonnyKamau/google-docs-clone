const mongoose = require("mongoose");
const userSchema = mongoose.Schema({
  name: {
    type: String,
    requred: true,
  },
  email: {
    type: String,
    requred: true,
  },
  profilePic: {
    type: String,
    requred: true,
  },
});

const User = mongoose.model("User", userSchema);
module.exports = User;
