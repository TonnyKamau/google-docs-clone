const express = require("express");
const User = require("../models/user");
const jwt = require("jsonwebtoken");
const auth = require("../middlewares/auth");

const authRouter = express.Router();

authRouter.post("/api/signup", async (req, res) => {
  try {
    const { name, email, profilePic } = req.body;
    // email already exist
    let user = await User.findOne({ email });
    if (!user) {
      user = new User({
        email,
        profilePic,
        name,
      });
      user = await user.save();
    }
    const token = jwt.sign({ id: user._id }, "passwordKey");
    res.json({ user, token });
  } catch (e) {}
});
authRouter.get("/", auth, async () => {
    const user = await User.findById(req.user);
    res.json({user,token:req.token});
});
module.exports = authRouter;
