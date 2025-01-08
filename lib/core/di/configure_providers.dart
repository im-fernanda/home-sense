import 'package:home_sense/services/auth_service.dart';
import 'package:home_sense/services/database_service.dart';
import 'package:home_sense/services/location_service.dart';
import 'package:home_sense/services/notification_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ConfigureProviders {
  final List<SingleChildWidget> providers;

  ConfigureProviders({required this.providers});

  static Future<ConfigureProviders> createDependencyTree() async {
    final authService = AuthService();
    final notificationService = NotificationService();
    final databaseService = DatabaseService();

    return ConfigureProviders(providers: [
      Provider<AuthService>.value(value: authService),
      Provider<NotificationService>.value(value: notificationService),
      Provider<DatabaseService>.value(value: databaseService)
    ]);
  }
}
