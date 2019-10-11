export class Product {
  id: number;
  productID: string;
  productName: string;
  productCategory: string;
  productColor: string;
  productSize: string;
  productMaterial: string;
  productPrice: number;
  creationDateTime: string;
  lastModifiedDateTime: string;

  constructor(ID: number, ProductID: string, ProductName: string, ProductCategory: string, ProductColor: string, ProductSize: string, ProductMaterial:string, ProductPrice: number, CreationDateTime: string, LastModifiedDateTime: string) {
    this.id = ID;
    this.productID = ProductID;
    this.productName = ProductName;
    this.productCategory = ProductCategory;
    this.productColor = ProductColor;
    this.productSize = ProductSize;
    this.productMaterial = ProductMaterial;
    this.productPrice = ProductPrice;
    this.creationDateTime = CreationDateTime;
    this.lastModifiedDateTime = LastModifiedDateTime;
  }
}


