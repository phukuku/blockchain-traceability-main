import express from "express";
import {
  AddNewProduct,
  deleteProduct,
  getProduct,
  getTotalProduct,
  update,
} from "~/controllers/productController";
import { catchError } from "~/middlewares/catch-error.middleware";
import { validate } from "~/middlewares/validate.middleware";
import {
  createProductValidator,
  productIdValidation,
  updateProductValidation,
} from "~/validators/product.validator";

const productRoute = express.Router();

productRoute.post(
  "/",
  validate(createProductValidator),
  catchError(AddNewProduct)
);

productRoute.get("/all/count", catchError(getTotalProduct));
productRoute.get(
  "/:productId",
  validate(productIdValidation),
  catchError(getProduct)
);

productRoute.patch("/", validate(updateProductValidation), catchError(update));
productRoute.delete("/:productId", validate(productIdValidation), catchError(deleteProduct));

export default productRoute;
