import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:premieres/app/core/config.dart';
import 'package:premieres/app/core/injection_container.dart';
import 'package:premieres/features/auth/auth_gate.dart';
import 'app/app.dart';
import 'firebase_options.dart';

void main() async {
  Config.appFlavor = Flavor.production;
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(primarySwatch: Colors.blueGrey),
    home: const AuthGate(),
  );
}
