import 'package:api_sdk/firebase_method/api_handles/firebase_api.dart';
import 'package:flutter/material.dart';
import 'package:shared/main.dart';
import 'package:shared/modules/bookstore/models/book_store_model.dart';

class FirebaseCRUDoperations extends ChangeNotifier {
  FirebaseApi _api = locator<FirebaseApi>();

  List<BookStore> bookStore;

  Future<List<BookStore>> fetchBookStores() async {
    var result = await _api.getDataCollection();
    bookStore = result.documents
        .map((doc) => BookStore.fromMap(doc.data, doc.documentID))
        .toList();
    print(bookStore);

    return bookStore;
  }

  Stream<dynamic> fetchBookStoresAsStream() {
    return _api.streamDataCollection();
  }

  Future<BookStore> getBookStoreById(String id) async {
    var doc = await _api.getDocumentById(id);
    return BookStore.fromMap(doc.data, doc.documentID);
  }

  Future removeBookStore(String id) async {
    await _api.removeDocument(id);
    notifyListeners();
    return;
  }

  Future updateBookStore(BookStore data, String id) async {
    await _api.updateDocument(data.toJson(), id);
    notifyListeners();
    return;
  }

  Future addBookStore(BookStore data) async {
    // ignore: unused_local_variable
    var result = await _api.addDocument(data.toJson());
    notifyListeners();
    return;
  }
}
