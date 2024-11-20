import type { Request, Response } from "express";
import { ok } from "~/utils/response.util";
import type { Product } from "../models/product";
import {
  countTotalProduct,
  createProduct,
  deleteProducts,
  getProductById,
  updateProduct,
} from "../services/productService";

export const AddNewProduct = async (request: Request, response: Response) => {
  const { productId, productName, manufacturer, productionDate, categoryId } =
    request.body as Product;

  const result = await createProduct({
    productId,
    productName,
    manufacturer,
    productionDate,
    categoryId,
  });

  return ok(response, result);
};

export const getTotalProduct = async (
  request: Request,
  response: Response
): Promise<any> => {
  return ok(response, await countTotalProduct());
};

export const update = async (request: Request, response: Response) => {
  const { productId, categoryId } = request.body as Product;
  const result = await updateProduct({
    productId,
    categoryId,
  });

  return ok(response, result);
};

export const deleteProduct = async (request: Request, response: Response) => {
  const { productId } = request.params;
  return ok(response, await deleteProducts(Number(productId)));
};

export const getProduct = async (request: Request, response: Response) => {
  const { productId } = request.params;
  return ok(response, await getProductById(Number(productId)));
};

export default {
  AddNewProduct,
  getTotalProduct,
  update,
  deleteProduct,
  getProduct,
};
