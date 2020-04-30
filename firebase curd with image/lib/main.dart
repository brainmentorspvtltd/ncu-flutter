import 'package:flutter/material.dart';

//-----------Routes-----------------------//
import './screens/products_list_screen.dart';
import './screens/add_product_screen.dart';
import './screens/edit_product_screen.dart';
import './screens/product_detail_screen.dart';
//--------------------------------------//

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FIREBASE CURD",
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepOrangeAccent,
      ),
      home: ProductListScreen(),
      routes: {
        AddProduct.routeName: (ctx) => AddProduct(),
        EditProduct.routeName: (ctx) => EditProduct(),
        ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
      },
    );
  }
}
