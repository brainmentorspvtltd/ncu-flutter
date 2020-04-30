import './product_model.dart';

class ProductOperations {
  static List<Product> _productList = [];
  static Product _currentProduct;

  static getProductList() {
    return _productList;
  }

  static getCurrentProduct() {
    return _currentProduct;
  }

  //when we get products from firebase there we call this method
  static setProductList(List<Product> productList) {
    _productList = productList;
  }

  static setCurrentProduct(Product product) {
    _currentProduct = product;
  }

  //add product to product list
  static addProduct(Product product) {
    _productList.insert(0, product);
  }

  //delete product
  static deleteProduct(id) {
    _productList.removeWhere((product) => product.productId == id);
  }
}
