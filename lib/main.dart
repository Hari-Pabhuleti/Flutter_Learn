import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:fullstack/app.dart';
import 'package:fullstack/data/repositories/autentication_repository.dart';
import 'package:fullstack/firebase_options.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


Future<void> main() async {
  //  Add Widgets Binding


  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();


  // Init GetX Local Storage
  await GetStorage.init();



  // Await Native Splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);


  // Initialize Firebase & Autentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
    (FirebaseApp value) => Get.put(AutenticationRepository()),
  );

  runApp(const App());
}

