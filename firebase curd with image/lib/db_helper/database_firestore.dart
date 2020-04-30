import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

import '../models/products/product_model.dart';
import '../models/products/product_operations.dart';

getProducts() async {
  List<Product> _productList = [];
  QuerySnapshot snapshot =
      await Firestore.instance.collection('products').getDocuments();
  // snapshot.documents.map((doc)=>Product.fromMapObject(doc.data,doc.documentID));
  snapshot.documents.forEach((document) {
    Product product = Product.fromMapObject(document.data, document.documentID);
    _productList.add(product);
  });
  ProductOperations.setProductList(_productList);
}

updateProduct(Product product) async {
  CollectionReference productRef = Firestore.instance.collection('products');
  await productRef.document(product.productId).updateData(product.toMap());
}

addProduct(
  Product product,
  File imageFile,
) async {
  if (imageFile != null) {
    print("uploading image");
    var fileExtension = path.extension(imageFile.path);
    print(fileExtension);
    var uuid = Uuid().v4();
    print('products/images/$uuid$fileExtension');
    final StorageReference firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('products/images/$uuid$fileExtension');
    await firebaseStorageRef
        .putFile(imageFile)
        .onComplete
        .catchError((onError) {
      print(onError);
      return false;
    });
    String url = await firebaseStorageRef.getDownloadURL();
    print("download url :$url");
    _saveData(product, imageUrl: url);
  } else {
    print('...skipping image upload');
    _saveData(product);
  }
}

_saveData(Product product, {String imageUrl}) async {
  CollectionReference productRef = Firestore.instance.collection('products');

  if (imageUrl != null) {
    product.image = imageUrl;
  }

  DocumentReference documentRef = await productRef.add(product.toMap());
  product.productId = documentRef.documentID;
  await documentRef.setData(product.toMap(), merge: true);
  ProductOperations.addProduct(product);
}

deleteProduct(Product product) async {
  if (product.image != null && product.image != "") {
    StorageReference storageReference =
        await FirebaseStorage.instance.getReferenceFromUrl(product.image);

    print(storageReference.path);
    await storageReference.delete();
    print('image deleted');
  }

  await Firestore.instance
      .collection('products')
      .document(product.productId)
      .delete();

  ProductOperations.deleteProduct(product.productId);
}
