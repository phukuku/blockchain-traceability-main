import type { Response } from "express";

export const ok = <T>(response: Response, data: T) => {
  return response.status(200).json(data);
};

export const noContent = (response: Response) => {
  return response.status(204).json();
};
