import type { NextFunction, Request, Response } from "express";
import Joi from "joi";
import pick from "lodash/pick";
import { BadRequestException } from "~/exceptions";

export interface ValidateRequestSchema {
  body?: Joi.ObjectSchema;
  query?: Joi.ObjectSchema;
  params?: Joi.ObjectSchema;
}

export const validate =
  (schema: ValidateRequestSchema) =>
  (request: Request, response: Response, next: NextFunction) => {
    const validSchema = pick(schema, ["body", "query", "params"]);
    const object = pick(request, Object.keys(validSchema));

    const { error } = Joi.compile(validSchema)
      .prefs({ errors: { label: "key" } })
      .validate(object);

    if (error) {
      const message =
        error?.details?.map((d) => d.message).join(", ") ??
        "Invalid request params or body";
      return next(new BadRequestException(-5, message));
    }
    return next();
  };
