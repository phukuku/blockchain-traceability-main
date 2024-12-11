import type { TransactionResponse } from "ethers";
import { productRegistryContract } from "../modules/blockchain";
import type { Product, UpdateCategoryIdDto } from "./../models/product";

const handleBlockchainError = (error: any) => {
  if (error.code === "CALL_EXCEPTION") {
    return error.reason || "Unknown error from smart contract";
  }
  return error.message || "An unexpected error occurred";
};

const normalizeProduct = (product: any) => ({
  productId: product[0].toString(),
  productName: product[1],
  manufacturer: product[2],
  productionDate: product[3].toString(),
  categoryId: product[4].toString(),
});

export const createProduct = async (product: Product) => {
  const { productId, productName, manufacturer, productionDate, categoryId } =
    product;

  try {
    const tx: TransactionResponse = await productRegistryContract.addProducts(
      productId,
      productName,
      manufacturer,
      productionDate,
      categoryId
    );
    return tx.hash;
  } catch (error: any) {
    return {
      success: false,
      message: handleBlockchainError(error),
      details: error,
    };
  }
};

export const countTotalProduct = async (): Promise<number> => {
  const totalProduct = await productRegistryContract.getProductCount();
  return totalProduct.toString();
};

export const deleteProducts = async (productId: number) => {
  try {
    const result = await productRegistryContract.deleteProduct(productId);
    console.log("Delete product successfully");
    return result.hash;
  } catch (error) {
    console.error("Error when delete product: ", error);
    throw new Error(handleBlockchainError(error));
  }
};

export const updateProduct = async (dto: UpdateCategoryIdDto) => {
  try {
    const { productId, categoryId } = dto;

    const tx: TransactionResponse =
      await productRegistryContract.updateCategory(productId, categoryId);

    return tx.hash;
  } catch (error) {
    console.error("error creating product", error);
    throw new Error(handleBlockchainError(error));
  }
};

export const getProductById = async (productId: number) => {
  try {
    const product = await productRegistryContract.getProduct(productId);
    return normalizeProduct(product);
    
  } catch (error: any) {
    return {
      success: false,
      message: handleBlockchainError(error),
    };
  }
};
