import 'package:flutter/material.dart';
import 'package:flutterfire_ui/i10n.dart';
import 'package:premieres/app/core/config.dart';
import '../features/auth/auth_gate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Awesome App',
      debugShowCheckedModeBanner: Config.debugShowCheckedModeBanner,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), //English, no country code
        Locale('pl', ''), //Polish, no country code
      ],
      theme: ThemeData.dark(),
      home: const AuthGate(),
    );
  }
}
