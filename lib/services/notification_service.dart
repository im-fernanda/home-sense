import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final DatabaseReference _db = FirebaseDatabase.instance.ref();
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  void initializeNotifications() {
    final FlutterLocalNotificationsPlugin _localNotifications =
        FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings androidInitialization =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitialization);

    _localNotifications.initialize(initializationSettings);

    // Criação do canal de notificações
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'notification_channel', // ID do canal
      'Notifications', // Nome do canal
      description:
          'Notificações sobre movimento detectado', // Descrição do canal
      importance: Importance.high,
    );

    _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  void setupNotification() {
    _db.child("comodos/sala/sensores/movimento").onValue.listen((event) {
      final data = event.snapshot.value as bool;

      if (data) {
        sendNotification("Movimento Detectado",
            "Algum movimento foi detectado em sua sala de estar!");
        print("chamou notificação");
      }
    });

    _db.child("comodos/cozinha/sensores/temperatura").onValue.listen((event) {
      final data = event.snapshot.value as int;

      if (data >= 35) {
        sendNotification("Alta Temperatura",
            "Uma temperatura muito alta foi detectada em sua cozinha!");
        print("chamou notificação");
      }
    });
  }

  void sendNotification(String title, String body) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'notification_channel',
      'Notifications',
      importance: Importance.high,
      priority: Priority.high,
    );
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    await _localNotifications.show(0, title, body, notificationDetails);
  }
}
