import 'package:todo_app/res/global.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  G.Log("Notitfication Title ${message.notification!.title}");
  G.Log("Notitfication Body ${message.notification!.body}");
  G.Log("Notitfication Payload ${message.data}");
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    G.Log("FCM TOken  $fcmToken");

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}
