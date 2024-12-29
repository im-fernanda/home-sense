import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:home_sense/services/location_service.dart';
import 'package:home_sense/ui/pages/home.dart';
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
    return MultiProvider(
      providers: data.providers,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'House Sense',
        home: AuthChecker(),
      ),
    );
  }
}
