
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_structure/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_structure/data/services/datebase_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';


Future<void> main() async{

  // Widgets Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Todo : Init local  storage
  await GetStorage.init();

  // Todo: Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // init firebase
  final AuthenticationRepository auth = AuthenticationRepository();
  Get.put(auth);


  runApp(const App());
}


