import type { NextFunction, Request, Response } from "express";
import { NotFoundException } from "~/exceptions";

export const notFoundHandler = (
  request: Request,
  response: Response,
  next: NextFunction
) => {
  return next(
    new NotFoundException(`Resource not found - ${request.originalUrl}`)
  );
};
