import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:home_sense/services/location_service.dart';
import 'package:home_sense/theme/theme.dart';
import 'package:home_sense/ui/pages/home_page.dart';
import 'package:home_sense/ui/widgets/auth_checker.dart';
import 'package:provider/provider.dart';
import 'core/di/configure_providers.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final data = await ConfigureProviders.createDependencyTree();

  final locationService = LocationService();
  // locationService.startLocationUpdates();

  runApp(MyApp(data: data));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.data});

  final ConfigureProviders data;

  @override
  Widget build(BuildContext context) {

    MaterialTheme theme = const MaterialTheme(TextTheme());
    return MultiProvider(
      providers: data.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aula',
        theme: theme.light(),
        darkTheme: theme.dark(),
        home: const AuthChecker(),
      ),
    );
  }
}
