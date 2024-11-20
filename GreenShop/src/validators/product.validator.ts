import Joi from "joi";

const message = {
  required: "{{#label}} is required",
  min: "{{#label}} must have at least {{#limit}} characters",
  number: "{{#label}} must be a number",
};

export const createProductValidator = {
  body: Joi.object().keys({
    productId: Joi.number().required().messages({
      "number.empty": message.required,
    }),
    productName: Joi.string().min(3).required().messages({
      "string.empty": message.required,
      "string.min": message.min,
    }),
    manufacturer: Joi.string().min(2).required().messages({
      "string.empty": message.required,
    }),
    productionDate: Joi.number()
      .integer()
      .default(Math.floor(Date.now() / 1000)),
    categoryId: Joi.number().required().messages({
      "number.empty": message.required,
    }),
  }),
};

export const getByNameValidation = {
  params: Joi.object().keys({
    name: Joi.string()
      .regex(/[0-9A-Fa-f]/)
      .required(),
  }),
};

export const updateProductValidation = {
  body: Joi.object().keys({
    productId: Joi.string().required().messages({
      "string.empty": message.required,
    }),
    categoryId: Joi.number().integer().min(1).required().messages({
      "number.integer": message.number,
    }),
  }),
};

export const productIdValidation = {
  params: Joi.object().keys({
    productId: Joi.number().required(),
  }),
};
