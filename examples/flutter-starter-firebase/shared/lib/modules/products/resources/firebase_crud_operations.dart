import 'package:api_sdk/firebase_method/api_handles/firebase_api.dart';
import 'package:flutter/material.dart';
import 'package:shared/main.dart';
import 'package:shared/modules/products/models/product_model.dart';

class FirebaseCRUDoperations extends ChangeNotifier {
  FirebaseApi _api = locator<FirebaseApi>();

  List<Product> products;

  Future<List<Product>> fetchProducts() async {
    var result = await _api.getDataCollection();
    products = result.documents
        .map((doc) => Product.fromMap(doc.data, doc.documentID))
        .toList();
    print(products);

    return products;
  }

  Stream<dynamic> fetchProductsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Product> getProductById(String id) async {
    var doc = await _api.getDocumentById(id);
    return Product.fromMap(doc.data, doc.documentID);
  }

  Future removeProduct(String id) async {
    await _api.removeDocument(id);
    return;
  }

  Future updateProduct(Product data, String id) async {
    await _api.updateDocument(data.toJson(), id);
    notifyListeners();
    return;
  }

  Future addProduct(Product data) async {
    // ignore: unused_local_variable
    var result = await _api.addDocument(data.toJson());
    notifyListeners();
    return;
  }
}
