import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../db_helper/database_firestore.dart';
import '../models/products/product_model.dart';
import '../models/products/product_operations.dart';

class EditProduct extends StatefulWidget {
  static const routeName = 'edit-product';

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final _form = GlobalKey<FormState>();

  final _titleFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _priceFocusNode = FocusNode();

  var _isLoading = false;
  Product _editedProduct;

  @override
  void initState() {
    _editedProduct = ProductOperations.getCurrentProduct();
    super.initState();
  }

  @override
  void dispose() {
    _titleFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _priceFocusNode.dispose();
    super.dispose();
  }

  Future<void> _saveForm() async {
    final isValue = _form.currentState.validate();
    if (!isValue) return;
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      await updateProduct(_editedProduct);
    } catch (error) {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("An error occurred!"),
          content: Text("Something Went wrong!"),
          actions: <Widget>[
            FlatButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
          ],
        ),
      );
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Product"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: SafeArea(
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Card(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Form(
                    key: _form,
                    child: ListView(
                      children: <Widget>[
                        TextFormField(
                          initialValue: _editedProduct.title,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(_titleFocusNode);
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter title';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Title",
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            filled: true,
                            contentPadding: EdgeInsets.only(
                                bottom: 10.0, left: 10.0, right: 10.0),
                          ),
                          textInputAction: TextInputAction.next,
                          onSaved: (value) {
                            _editedProduct.title = value;
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          initialValue: _editedProduct.description,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(_descriptionFocusNode);
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter des';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Description",
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            filled: true,
                            contentPadding: EdgeInsets.only(
                                bottom: 10.0, left: 10.0, right: 10.0),
                          ),
                          textInputAction: TextInputAction.next,
                          onSaved: (value) {
                            _editedProduct.description = value;
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          initialValue: _editedProduct.price.toString(),
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(_priceFocusNode);
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter price';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Price",
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            filled: true,
                            contentPadding: EdgeInsets.only(
                                bottom: 10.0, left: 10.0, right: 10.0),
                          ),
                          onSaved: (value) {
                            _editedProduct.price = double.parse(value);
                          },
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
