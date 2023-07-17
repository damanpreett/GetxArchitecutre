// import 'dart:io';
// import 'dart:isolate';
// import 'dart:math';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// // import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:service_provider_two/models/send_msg_model.dart';
// import 'package:service_provider_two/utils/utils.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import '../models/chat_last_msg_model.dart';
//
// class Authentication {
//   static var firebaseAuth = FirebaseAuth.instance;
//   static var fireStoreAuth = FirebaseFirestore.instance;
//   static FirebaseMessaging messaging = FirebaseMessaging.instance;
//   final fireStorage = FirebaseStorage.instance;
//
//
//   static Future<String> uploadFile(String path){
//     var number=Random.secure().nextInt(8234873);
//     final storageRef = FirebaseStorage.instance.ref();
//     return storageRef.child('Data').child('chatImages').child('image_$number').putFile(File(path)).then((p0) {
//       return p0.ref.getDownloadURL();
//     } ).onError((error, stackTrace) {
//       print('Error : $error');
//       return error.toString();
//     });
//   }
//   static Future<String> uploadAudioRecoding(String path){
//     var number=Random.secure().nextInt(8234873);
//     final storageRef = FirebaseStorage.instance.ref();
//     return storageRef.child('Data').child('recoding').child('recoding_$number').putFile(File(path)).then((p0) {
//       return p0.ref.getDownloadURL();
//     } ).onError((error, stackTrace) {
//       print('Error : $error');
//       return error.toString();
//     });
//   }
//
//   static Future<void> signOut({required BuildContext context}) async {
//     final GoogleSignIn googleSignIn = GoogleSignIn();
//
//     try {
//       if (!kIsWeb) {
//         await googleSignIn.signOut();
//       }
//       await firebaseAuth.signOut();
//     } catch (e) {
//       Get.snackbar("Error", 'Error signing out. Try again.');
//     }
//   }
//
//   static Future<User?> signInWithGoogle() async {
//     FirebaseAuth auth = firebaseAuth;
//     User? user;
//     if (kIsWeb) {
//       GoogleAuthProvider authProvider = GoogleAuthProvider();
//       try {
//         final UserCredential userCredential =
//             await auth.signInWithPopup(authProvider);
//         user = userCredential.user;
//       } catch (e) {
//         if (kDebugMode) {
//           print('Web User Login Failed Due to $e');
//         }
//       }
//     } else {
//       final GoogleSignIn googleSignIn = GoogleSignIn();
//       if (await googleSignIn.isSignedIn()) {
//         if (kDebugMode) {
//           print("inside login pre");
//         }
//         if (!kIsWeb) {
//           await googleSignIn.signOut();
//         } else {
//           await auth.signOut();
//         }
//       } else {
//         if (kDebugMode) {
//           print("else login pre");
//         }
//       }
//       final GoogleSignInAccount? googleSignInAccount =
//           await googleSignIn.signIn();
//       if (googleSignInAccount != null) {
//         final GoogleSignInAuthentication googleSignInAuthentication =
//             await googleSignInAccount.authentication;
//         final AuthCredential credential = GoogleAuthProvider.credential(
//           accessToken: googleSignInAuthentication.accessToken,
//           idToken: googleSignInAuthentication.idToken,
//         );
//
//         try {
//           final UserCredential userCredential =
//               await auth.signInWithCredential(credential);
//           user = userCredential.user;
//         } on FirebaseAuthException catch (e) {
//           if (kDebugMode) {
//             print('User Login Failed Due to $e');
//           }
//           if (e.code == 'account-exists-with-different-credential') {
//             // ...
//           } else if (e.code == 'invalid-credential') {
//             // ...
//           }
//         } catch (e) {
//           // ...
//         }
//       }
//     }
//     return user;
//   }
//
//   static Future<bool> checkChatExist(String id) async {
//    return fireStoreAuth.collection('Chat').doc(id).get().then((value) {
//       if (value.exists == true) {
//         return true;
//       } else {
//         return false;
//       }
//     }).onError((error, stackTrace) {
//       Utils.snackBar('Error', error.toString());
//       return  false;
//     });
//   }
//
//   static Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getUserChatUsers(
//       String id) async {
//     return fireStoreAuth
//         .collection('Chat')
//         .where(id)
//         .orderBy("time", descending: true)
//         .snapshots();
//   }
//
//   static Future<QuerySnapshot<Map<String, dynamic>>> getUserChatUsers2(
//       String id) async {
//     return fireStoreAuth.collection('Chat').where(id).get();
//   }
//
// // static void tes(String id) async{
// //   return  fireStoreAuth.collection('Chat').get().then((value){
// //     if(value.size>=0){
// //       for(int i=0;i<value.docs.length;i++){
// //         var id = value.docs[i].id;
// //         print("id is :$id");
// //       }
// //     }
// //   });
// // }
//   static subscribeTopic(String id) {
//     if (kDebugMode) {
//       print('subscribe id is user_${id}');
//     }
//     messaging
//         .subscribeToTopic("user_${id}")
//         .then((value) => {print("subscribe complete ")})
//         .onError((error, stackTrace) => {print("onError subscribed $error")});
//   }
//
//   static Future<bool> unSubscribeTopic(String id) async {
//     if (kDebugMode) {
//       print('unSubscribe id is ${id}');
//     }
//     var result = false;
//     messaging
//         .unsubscribeFromTopic(id)
//         .then((value) => {result = true})
//         .onError((error, stackTrace) => {result = false});
//     return result;
//   }
//
//   static Future<bool> sendMsg(
//       String chatId,
//       String path,
//       String msg,
//       int time,
//       int msgType,
//       String senderId,
//       String senderName,
//       String senderPic,
//       String receiverId,
//       String receiverName,
//       String receiverPic,
//       String serviceId) async {
//     bool response = false;
//     SendMsgModel model = SendMsgModel(
//         msg: msg,
//         msgType: msgType,
//         msgTime: time,
//         chatId: chatId,
//         senderId: senderId,
//         receiverId: receiverId,
//         path: path);
//     if (await checkChatExist(chatId)) {
//       var lastMsgModel = ChatLastMsgModel(
//           chatId: chatId,
//           senderId: senderId,
//           receiverId: receiverId,
//           msgType: msgType,
//           msg: msg,
//           path: path,
//           msgTime: time);
//       var modelll = {
//         'lastMsg': lastMsgModel.toJson(),
//         'time': time,
//       };
//       fireStoreAuth
//           .collection('Chat')
//           .doc(chatId)
//           .collection('Messages')
//           .doc()
//           .set(model.toJson())
//           .then((value) => response = true)
//           .onError((error, stackTrace) => response = false);
//       incrementMsgCount(chatId,receiverId);
//       fireStoreAuth
//           .collection('Chat')
//           .doc(chatId)
//           .set(modelll, SetOptions(merge: true))
//           .then((value) {
//       }).onError((error, stackTrace) {
//         print('erro si $error');
//       });
//
//  /*      Isolate.run(() =>fireStoreAuth
//          .collection('Chat')
//          .doc(chatId)
//          .collection('Messages')
//          .doc()
//          .set(model.toJson())
//          .then((value) => response = true)
//          .onError((error, stackTrace) => response = false));*/
//     }
//     else {
//       print('chat not exist');
//       fireStoreAuth
//           .collection('Chat')
//           .doc(chatId)
//           .collection('Messages')
//           .doc()
//           .set(model.toJson())
//           .then((value) => response = true)
//           .onError((error, stackTrace) => response = false);
//       setupUserData(chatId, path, msg, time, msgType, senderId, senderName,
//           senderPic, receiverId, receiverName, receiverPic, serviceId);
//
//     }
//     /*  Isolate.run(() => setupUserData( chatId, path, msg, time, msgType, senderId, senderName, senderPic, receiverId, receiverName, receiverPic));
//       Isolate.run(() =>    fireStoreAuth
//           .collection('Chat')
//           .doc(chatId)
//           .collection('Messages')
//           .doc()
//           .set(model.toJson())
//           .then((value) => response = true)
//           .onError((error, stackTrace) => response = false));
//     }*/
//     return response;
//   }
//
//   static Future<bool> setupUserData(
//       String chatId,
//       String path,
//       String msg,
//       int time,
//       int msgType,
//       String senderId,
//       String senderName,
//       String senderPic,
//       String receiverId,
//       String receiverName,
//       String receiverPic,
//       String serviceId) async {
//     bool response = false;
//     var lastMsgModel = ChatLastMsgModel(
//         chatId: chatId,
//         senderId: senderId,
//         receiverId: receiverId,
//         msgType: msgType,
//         msg: msg,
//         path: path,
//         msgTime: time);
//     print('service id ${serviceId}');
//     var memberList = [senderId, receiverId];
//     var model = {
//       'serviceId': serviceId,
//       senderId: {"image": senderPic, "name": senderName},
//       receiverId: {"image": receiverPic, "name": receiverName},
//       'chatBlockStatus': false,
//       'chatId': chatId,
//       'unReadMsgCount': {senderId: 0, receiverId: 0},
//       'lastMsg': lastMsgModel.toJson(),
//       'time': time,
//       'members': memberList
//     };
//     fireStoreAuth
//         .collection('Chat')
//         .doc(chatId)
//         .set(model, SetOptions(merge: true))
//         .then((value) {
//       print('data sended setup');
//       incrementMsgCount(chatId,receiverId);
//       response = true;
//     }).onError((error, stackTrace) {
//       print('erro si $error');
//       response = false;
//     });
//
//     return response;
//   }
//
//   static incrementMsgCount(String chatId, String id) {
//     print('inside update increment method');
//     fireStoreAuth
//         .collection('Chat')
//         .doc(chatId)
//         .update({'unReadMsgCount.$id': FieldValue.increment(1)})
//         .then((value) => print('value incremented successfull'))
//         .onError((error, stackTrace) => print('increment value error $error'));
//   }
// static updateMsgCountStatus(String chatId, String id) {
//     print('inside update increment method');
//     fireStoreAuth
//         .collection('Chat')
//         .doc(chatId)
//         .update({'unReadMsgCount.$id': 0})
//         .then((value) => print('value incremented successfull'))
//         .onError((error, stackTrace) => print('increment value error $error'));
//   }
//
//   static Stream<QuerySnapshot<Map<String, dynamic>>> getChat(String chatId) {
//     return fireStoreAuth
//         .collection("Chat")
//         .doc(chatId)
//         .collection("Messages")
//         .orderBy("msgTime", descending: false)
//         .snapshots();
//   }
// }
