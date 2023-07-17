// import 'dart:io';
// import 'dart:math';
// import 'package:app_settings/app_settings.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
//
// import '../routes/routes_name.dart';
//
// class NotificationService {
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
//   void initLocalNotification(BuildContext context,
//       RemoteMessage message) async {
//     var androidInitialization = AndroidInitializationSettings(
//         '@mipmap/ic_launcher');
//         // '@mipmap-hdpi/ic_launcher');
//     var iosInitialization = DarwinInitializationSettings();
//     var initializationSetting = InitializationSettings(
//         android: androidInitialization, iOS: iosInitialization);
//     await _flutterLocalNotificationsPlugin.initialize(
//       initializationSetting, onDidReceiveNotificationResponse: (payload) {
//         handleNotification(context, message);
//     });
//   }
//   Future<void> setupInteractMessage(BuildContext context)async{
//
//     //When app is terminated
//     RemoteMessage? initialMessage =  await FirebaseMessaging.instance.getInitialMessage();
//     if(initialMessage!=null){
//       handleNotification(context, initialMessage);
//     }
//
//     // When app is in background
//     FirebaseMessaging.onMessageOpenedApp.listen((event) {
//       handleNotification(context, event);
//       // if(Platform.isIOS) {
//       //   foreGroundMessage();
//       // }
//       // if(Platform.isAndroid) {
//       //   initLocalNotification(context, event);
//       //   showNotification(event);
//       // }else {
//       //   showNotification(event);
//       // }
//     });
//   }
//
//   void handleNotification(BuildContext context , RemoteMessage message){
//     if(message.data['id'] == 'chatId'){
//       print('naviagte to your page &&&&&&&&&&&&&&&&&&&&&');
//       // Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen(),));
//     }else{
//       print('else naviagte to your page &&&&&&&&&&&&&&&&&&&&&');
//     }
//     // 'id':id,
//     // 'name':name,
//     // 'receiverName':receiverName,
//     // 'receiverId':receiverId,
//     // 'senderId':senderId,
//     // 'serviceId':serviceId,
//     // 'login':login,
//     // 'channelName':'Notification Send',
//     // 'channelDescription':'Notification description',
//     Get.toNamed(RoutesName.chatScreen,
//         arguments: {
//           'name': message.data['receiverName'],
//           'serviceId': message.data['serviceId'],
//           'id': message.data['id'],
//           'senderId': message.data['serviceId'],
//
//           'receiverId': message.data['senderId'],
//           "receiverName":message.data['name']
//         });
//   }
//
//   void firebaseInit(BuildContext context) {
//
//     // for background message maybe search once before use it .
//     FirebaseMessaging.onMessage.listen((event) {
//       print('inside onMessage listener  title:${event.notification?.title}');
//       if(Platform.isIOS) {
//         foreGroundMessage();
//       }
//       if(Platform.isAndroid) {
//         initLocalNotification(context, event);
//
//         showNotification(event);
//       }else {
//         showNotification(event);
//       }
//     });
//     FirebaseMessaging.onBackgroundMessage((event) async {
//       print('inside onBackgroundMessage listener  title:${event.notification?.title}');
//       if(Platform.isIOS) {
//         foreGroundMessage();
//       }
//       if(Platform.isAndroid) {
//         initLocalNotification(context, event);
//         showNotification(event);
//       }else {
//         showNotification(event);
//       }
//     });
//   }
//
//   Future<void> showNotification(RemoteMessage message) async {
//     print('show Notification called inside foregorund case');
//     AndroidNotificationChannel channel = AndroidNotificationChannel(
//         message.data['id'],
//         'High importance notification');
//     AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
//         channel.id, channel.name, channelDescription: 'Channel description',importance: Importance.high,priority: Priority.high);
//    DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(
//      presentAlert: true,
//      presentBadge: true,
//      presentSound: true
//    ); // firebase not using darwin for notification for ios , ios auto handle this.
//
//     NotificationDetails notificationDetails =NotificationDetails(android: androidNotificationDetails,iOS: darwinNotificationDetails);
//     _flutterLocalNotificationsPlugin.show(
//         Random.secure().nextInt(1000), message.notification?.title, message.notification?.body,
//         // Random.secure().nextInt(1000), 'Name', message.data['receiverName'],
//         notificationDetails);
//   }
//
//   void requestNotificationPermission() async {
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: true,
//       badge: true,
//       carPlay: true,
//       provisional: true,
//       sound: true,
//     );
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       print('user granted notification permission');
//     } else
//     if (settings.authorizationStatus == AuthorizationStatus.provisional) {
//       print('user granted provisional permission');
//     } else {
//       AppSettings.openAppSettings(type: AppSettingsType.notification);
//       print('userDenied permissioin');
//     }
//   }
//
//   Future<String> getToken() async {
//     var token = await messaging.getToken();
//     print('token : ${token}');
//     return token!;
//   }
//
//   void isTokenRefreshed() async {
//     messaging.onTokenRefresh.listen((event) {
//       print('inside token refreshed');
//       print('=> refreshed token is:${event}');
//     });
//   }
//   void foreGroundMessage()async{
//     await  FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true
//     );
//   }
// }