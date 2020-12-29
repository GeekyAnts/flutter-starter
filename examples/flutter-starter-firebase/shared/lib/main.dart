export 'package:shared/modules/authentication/auth.dart';
export 'package:shared/modules/authentication/bloc/bloc_controller.dart';
export 'package:shared/modules/bookstore/models/book_store_model.dart';
export 'modules/bookstore/resources/firebase_crud_operations.dart';
import 'package:api_sdk/firebase_method/api_handles/firebase_api.dart';
import 'package:get_it/get_it.dart';
import 'modules/bookstore/resources/firebase_crud_operations.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => FirebaseApi('bookstore'));
  locator.registerLazySingleton(() => FirebaseCRUDoperations());
}
