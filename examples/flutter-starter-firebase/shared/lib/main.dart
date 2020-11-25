export 'package:shared/modules/authentication/auth.dart';
export 'package:shared/modules/authentication/bloc/bloc_controller.dart';
export 'modules/products/resources/firebase_crud_operations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:api_sdk/firebase_method/api_handles/firebase_api.dart';
import 'package:get_it/get_it.dart';
import 'modules/products/resources/firebase_crud_operations.dart';

Future<SharedPreferences> prefs = SharedPreferences.getInstance();

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => FirebaseApi('products'));
  locator.registerLazySingleton(() => FirebaseCRUDoperations());
}
