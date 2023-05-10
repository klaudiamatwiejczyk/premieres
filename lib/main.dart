import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:premieres/app/core/injection_container.dart';
import 'package:premieres/features/auth/auth_gate.dart';
import 'firebase_options.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:premieres/repositories/uselessfacts_repository.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setupDependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Premieres',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const AuthGate(),
    );
  }
}

void setupDependencyInjection() {
  final getIt = GetIt.instance;

  getIt.registerLazySingleton<http.Client>(() => http.Client());

  getIt.registerLazySingleton<UselessFactsRepository>(
      () => UselessFactsRepository(getIt<http.Client>()));
      
   
}
