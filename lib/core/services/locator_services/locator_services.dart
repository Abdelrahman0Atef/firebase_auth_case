import 'package:firebase_auth_case/core/services/firebase_service/firebase_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void locatorServices(){
  getIt.registerLazySingleton<FirebaseService>(() => FirebaseService());
}