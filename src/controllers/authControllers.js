const jwt = require("jsonwebtoken");
const { SECRET_KEY } = process.env;
const bcrypt = require("bcrypt");
const joi = require("joi");
const db = require("../database/db_connection");
const authModel = require("../models/authModels");
const userModel = require("../models/usersModels");
const { response } = require("../helpers/response");

const registerAccount = async (req, res) => {
  const schema = joi.object({
    username: joi.string().max(20).min(6).required().messages({
      "string.base": "Username should be a type of 'text'",
      "string.empty": "Username cannot be an empty field",
      "string.max": "Username should have a max length of {#limit}",
      "string.min": "Username should have a minimum length of {#limit}",
      "any.required": "Username is a required field",
    }),
    password: joi
      .string()
      .required()
      .min(8)
      .pattern(
        /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%^*#?&])[A-Za-z\d@$!%^*#?&]{8,}$/
      )
      .messages({
        "string.empty": "Password cannot be an empty field",
        "string.min": "Password should have a minimum length of {#limit}",
        "any.required": "Password is a required field",
        "string.pattern.base":
          "Password must contain letter, number and special character",
      }),
    fullname: joi.string().max(50).required().messages({
      "string.base": "Fullname should be a type of 'text'",
      "string.empty": "Fullname cannot be an empty field",
      "string.max": "Fullname should have a max length of {#limit}",
      "any.required": "Fullname is a required field",
    }),
  });
  const { value, error } = schema.validate(req.body);
  if (error) {
    return response(res, "Error!!", { error: error.message }, 400, false);
  }
  try {
    await db.query("BEGIN");
    const isExist = await authModel.checkUserAccount(value.username);
    if (isExist.length) {
      return response(res, "Username already exist!!", {}, 400, false);
    }
    const salt = await bcrypt.genSalt(10);
    const hashPassword = await bcrypt.hash(value.password, salt);
    const result = await authModel.createAccount(value.username, hashPassword);
    const valuesId = result.rows[0].id;
    await userModel.addUsers(valuesId, value.fullname);
    await db.query("COMMIT");
    return response(res, "Success registered account", {}, 200, true);
  } catch (error) {
    await db.query("ROLLBACK");
    return response(
      res,
      "Internal server Error!",
      { error: error.message },
      500,
      false
    );
  }
};

const loginAccount = async (req, res) => {
  try {
    const schema = joi.object({
      username: joi.string().max(20).min(6).required().messages({
        "string.base": "Username should be a type of 'text'",
        "string.empty": "Username cannot be an empty field",
        "string.max": "Username should have a max length of {#limit}",
        "string.min": "Username should have a minimum length of {#limit}",
        "any.required": "Username is a required field",
      }),
      password: joi.string().required().min(8).messages({
        "string.empty": "Password cannot be an empty field",
        "string.min": "Password should have a minimum length of {#limit}",
        "any.required": "Password is a required field",
      }),
    });
    const { value, error } = schema.validate(req.body);
    if (error) {
      return response(res, "Error!!", { error: error.message }, 400, false);
    }
    const results = await authModel.checkUserAccount(value.username);
    if (results.length) {
      const hashed = results[0].password;
      const validUser = await bcrypt.compare(value.password, hashed);
      if (!validUser) {
        return response(res, "Wrong password!!!", {}, 400, false);
      } else {
        const { username } = results[0];
        const payload = { username };
        const token = jwt.sign(payload, SECRET_KEY);
        return response(res, "Login successfully ", { token }, 200, true);
      }
    } else {
      return response(
        res,
        "User doesn't exist! or Wrong username !!",
        {},
        400,
        false
      );
    }
  } catch (error) {
    return response(
      res,
      "Internal server Error!",
      { error: error.message },
      500,
      false
    );
  }
};

module.exports = {
  registerAccount,
  loginAccount,
};
