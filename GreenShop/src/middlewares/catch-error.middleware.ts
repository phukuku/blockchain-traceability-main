import type { NextFunction, Request, Response } from "express";

export const catchError =
  (fn: (_request: Request, _response: Response, _next: NextFunction) => any) =>
  (request: Request, response: Response, next: NextFunction) =>
    fn(request, response, next).catch((e: Error) => next(e));
