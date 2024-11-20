export interface Product {
  productId: number;
  productName: string;
  manufacturer: string;
  productionDate: number;
  categoryId: number;
}

export interface UpdateCategoryIdDto {
  productId: number;
  categoryId: number;
}
