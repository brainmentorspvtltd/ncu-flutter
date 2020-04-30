import 'package:flutter/material.dart';
import '../models/products/product_operations.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    var _product = ProductOperations.getCurrentProduct();
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(productNotifier.currentProduct.title),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _product.image != null && _product.image != ""
                  ? Image.network(
                      _product.image,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      height: 250,
                    )
                  : Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.green,
                    ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Rs.${_product.price}',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Text(
                  _product.description,
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
