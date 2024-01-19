import 'package:todo_app/res/global.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationServices {
  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        badge: true,
        announcement: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      G.Log("User granted permission");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      G.Log("User granted provisional permission");
    } else {
      G.Log("User denied permission");
    }
    whenTokenRefresh();
  }

  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token ?? "";
  }

  // some time token refreshes run time you have add listen made logic when token refreshes by calling this function
  void whenTokenRefresh() {
    messaging.onTokenRefresh.listen((event) {
      G.Log(event);
    });
  }

  void firebaseInit() {
    FirebaseMessaging.onMessage.listen((noti) {
      G.Log("Notitfication Title ${noti.notification!.title}");
      G.Log("Notitfication Body ${noti.notification!.body}");
      G.Log("Notitfication Payload ${noti.data}");
    });
  }
}

// Future<void> handleBackgroundMessage(RemoteMessage message) async {
//   G.Log("Notitfication Title ${message.notification!.title}");
//   G.Log("Notitfication Body ${message.notification!.body}");
//   G.Log("Notitfication Payload ${message.data}");
// }

// class FirebaseApi {
//   final _firebaseMessaging = FirebaseMessaging.instance;

//   Future<void> initNotification() async {
//     await _firebaseMessaging.requestPermission();
//     final fcmToken = await _firebaseMessaging.getToken();
//     G.Log("FCM TOken  $fcmToken");

//     FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//   }
// }
