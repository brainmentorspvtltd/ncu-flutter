import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../db_helper/database_firestore.dart';
import '../models/products/product_model.dart';
import '../models/products/product_operations.dart';

import './add_product_screen.dart';
import './edit_product_screen.dart';
import './product_detail_screen.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  var _isLoading = true;
  List<Product> _productList = [];

  Future<void> _refreshList() async {
    //get list from firebase this method is defined inside
    // database_firestore.dart file
    await getProducts();
    //after setting our products list we
    //get our products list from product operations file
    //and set into our local list;
    _productList = ProductOperations.getProductList();
    setState(() {});
  }

  @override
  void initState() {
    _refreshList().then((_) {
      print('inside didChangedependancies');
      _isLoading = false;
    });
    super.initState();
  }

  Widget _shimmerEffect(context) {
    return Center(
      child: Shimmer.fromColors(
        baseColor: Colors.red,
        highlightColor: Colors.green,
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 19.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 19.0),
                      child: FlutterLogo(
                        size: 70.0,
                      ),
                    ),
                    Text(
                      'Welcome to Flutter Firestore',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: new TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products List"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddProduct.routeName).then((_) {
                _refreshList();
              });
            },
          ),
        ],
      ),
      body: _isLoading
          ? _shimmerEffect(context)
          : RefreshIndicator(
              onRefresh: () => _refreshList(),
              child: _buildListView(context),
            ),
    );
  }

  Widget _buildListView(context) {
    return ListView.builder(
      itemCount: _productList.length,
      itemBuilder: (_, i) => Column(
        children: <Widget>[
          Card(
            child: GestureDetector(
              onDoubleTap: () {
                ProductOperations.setCurrentProduct(_productList[i]);
                Navigator.of(context).pushNamed(ProductDetailScreen.routeName);
              },
              child: ListTile(
                leading: _productList[i].image != null &&
                        _productList[i].image != ""
                    ? CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(_productList[i].image),
                        backgroundColor: Colors.transparent,
                      )
                    : CircleAvatar(),
                title: Text(_productList[i].title),
                subtitle: Text(_productList[i].description),
                trailing: Container(
                  width: 100,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          ProductOperations.setCurrentProduct(_productList[i]);

                          Navigator.of(context)
                              .pushNamed(EditProduct.routeName);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          ProductOperations.setCurrentProduct(_productList[i]);
                          deleteProduct(_productList[i]);
                          _refreshList();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
