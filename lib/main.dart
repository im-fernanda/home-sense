import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:home_sense/theme/theme.dart';
import 'package:home_sense/ui/pages/home_page.dart';
import 'package:home_sense/ui/widgets/auth_checker.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: const MaterialTheme(TextTheme()).light(),
      darkTheme: const MaterialTheme(TextTheme()).dark(),
      highContrastDarkTheme:
          const MaterialTheme(TextTheme()).darkHighContrast(),
      highContrastTheme: const MaterialTheme(TextTheme()).lightHighContrast(),
      home: const AuthChecker(),
    );
  }
}
