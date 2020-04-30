import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../db_helper/database_firestore.dart';
import '../models/products/product_model.dart';

class AddProduct extends StatefulWidget {
  static const routeName = 'add-product';

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _form = GlobalKey<FormState>();

  bool _isLoading = false;

  File _image;
  String _title, _description;
  double _price;

  //take pic from camera
  Future<void> _takePicture() async {
    File imageFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 400,
    );
    // File imageFile = await ImagePicker.pickImage(
    //     source: ImageSource.gallery, imageQuality: 50, maxWidth: 400);
    if (imageFile == null) {
      return;
    }
    setState(() {
      _image = imageFile;
      // _imageName = fileName;
    });
  }

  //save form data to database
  Future<void> _saveForm() async {
    final isValue = _form.currentState.validate();
    if (!isValue) return;
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });

    try {
      var _product = Product(
        title: _title,
        description: _description,
        price: _price,
        image: '',
      );
      //firebase function to insert product into firestore
      await addProduct(_product, _image);
    } catch (error) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("An error occurred!"),
          content: Text("Something Went wrong! : $error"),
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
        title: Text("Add New Product"),
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
                            _title = value;
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter description';
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
                            _description = value;
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.number,
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
                          textInputAction: TextInputAction.next,
                          onSaved: (value) {
                            _price = double.parse(value);
                          },
                        ),
                        SizedBox(height: 20),
                        Row(
                          //crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              width: 150,
                              height: 100,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                top: 8,
                                right: 10,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                              ),
                              child: _image != null
                                  ? Image.file(
                                      _image,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    )
                                  : Text(
                                      "No Image",
                                      textAlign: TextAlign.center,
                                    ),
                            ),
                            Expanded(
                              child: RaisedButton.icon(
                                onPressed: () {
                                  _takePicture();
                                },
                                icon: Icon(Icons.camera_alt),
                                label: Text("Take Picture"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
