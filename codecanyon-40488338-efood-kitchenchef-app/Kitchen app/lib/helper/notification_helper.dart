import 'dart:io';

import 'package:efood_kitchen/controller/order_controller.dart';
import 'package:efood_kitchen/view/base/notification_dialog.dart';
import 'package:efood_kitchen/view/screens/order/order_details_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:efood_kitchen/util/app_constants.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

import 'responsive_helper.dart';

class NotificationHelper {

  static Future<void> initialize(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize = new AndroidInitializationSettings('notification_icon');
    var iOSInitialize = new DarwinInitializationSettings();
    var initializationsSettings = new InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
    flutterLocalNotificationsPlugin.initialize(
      initializationsSettings,
      onDidReceiveNotificationResponse: (NotificationResponse? notificationResponse) async {
      // TODO: Route
      try{
        if(notificationResponse?.payload != null) {
          // Get.toNamed(RouteHelper.getOrderDetailsRoute(int.parse(payload)));

        }
      }catch (e) {}
      return;
    },);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("onMessage: ${message.notification?.title}/${message.notification?.body}/${message.notification?.titleLocKey}");
      print("onMessage: body${message.notification?.body}");
      Get.find<OrderController>().getOrderList(1);
      Get.dialog(NotificationDialog(title: '${message.notification?.title}', body: '${message.notification?.body}',  orderId: int.parse(message.notification!.body!)));
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("onOpenApp: ${message.notification?.title}/${message.notification?.body}/${message.notification?.titleLocKey}");
      Get.find<OrderController>().getOrderList(1);
      try{
        if(message.notification!.body!.isNotEmpty) {
          if(ResponsiveHelper.isMobile(Get.context)){
            Get.to(OrderDetailsScreen(orderId: int.parse(message.notification!.body!)));
          }else{
            Get.find<OrderController>().updateOrderStatusTabs(OrderStatusTabs.confirmed);
            Get.find<OrderController>().orderStatusUpdate(int.parse(message.notification!.body!), 'confirm');
            Get.find<OrderController>().setOrderIdForOrderDetails(int.parse(message.notification!.body!), 'confirm','');
            Get.find<OrderController>().getOrderDetails(int.parse(message.notification!.body!));

          }
          print('here is title lock key=====>${message.notification!.body!}');


        }
      }catch (e) {}
    });
  }

  static Future<void> showNotification(RemoteMessage message, FlutterLocalNotificationsPlugin fln, bool data) async {
    String? _title;
    String? _body;
    String? _orderID;
    String? _image;
    if(data) {
      _title = message.data['title'];
      _body = message.data['body'];
      _orderID = message.data['order_id'];
      _image = (message.data['image'] != null && message.data['image'].isNotEmpty)
          ? message.data['image'].startsWith('http') ? message.data['image']
          : '${AppConstants.BASE_URL}/storage/app/public/notification/${message.data['image']}' : null;
    }else {
      _title = message.notification?.title;
      _body = message.notification?.body;
      _orderID = message.notification?.titleLocKey;
      if(GetPlatform.isAndroid) {
        _image = (message.notification?.android?.imageUrl != null && message.notification!.android!.imageUrl!.isNotEmpty)

            ? message.notification!.android!.imageUrl!.startsWith('http') ? message.notification!.android!.imageUrl
            : '${AppConstants.BASE_URL}/storage/app/public/notification/${message.notification!.android!.imageUrl}' : null;
      }else if(GetPlatform.isIOS) {
        _image = (message.notification?.apple?.imageUrl != null && message.notification!.apple!.imageUrl!.isNotEmpty)
            ? message.notification!.apple!.imageUrl!.startsWith('http') ? message.notification?.apple?.imageUrl
            : '${AppConstants.BASE_URL}/storage/app/public/notification/${message.notification?.apple?.imageUrl}' : null;
      }
    }

    if(_image != null && _image.isNotEmpty) {
      try{
        await showBigPictureNotificationHiddenLargeIcon(_title, _body, _orderID, _image, fln);
      }catch(e) {
        await showBigTextNotification(_title, _body, _orderID, fln);
      }
    }else {
      await showBigTextNotification(_title, _body, _orderID, fln);
    }
  }

  static Future<void> showTextNotification(String title, String body, String orderID, FlutterLocalNotificationsPlugin fln) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'efood', 'efood', playSound: true,
      importance: Importance.max, priority: Priority.max, sound: RawResourceAndroidNotificationSound('notification'),
    );
    const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
    await fln.show(0, title, body, platformChannelSpecifics, payload: orderID);
  }

  static Future<void> showBigTextNotification(String? title, String? body, String? orderID, FlutterLocalNotificationsPlugin fln) async {
    BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
      body!, htmlFormatBigText: true,
      contentTitle: title, htmlFormatContentTitle: true,
    );
    AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'efood', 'efood', importance: Importance.max,
      styleInformation: bigTextStyleInformation, priority: Priority.max, playSound: true,
      sound: RawResourceAndroidNotificationSound('notification'),
    );
    NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
    await fln.show(0, title, body, platformChannelSpecifics, payload: orderID);
  }

  static Future<void> showBigPictureNotificationHiddenLargeIcon(String? title, String? body, String? orderID, String image, FlutterLocalNotificationsPlugin fln) async {
    final String largeIconPath = await _downloadAndSaveFile(image, 'largeIcon');
    final String bigPicturePath = await _downloadAndSaveFile(image, 'bigPicture');
    final BigPictureStyleInformation bigPictureStyleInformation = BigPictureStyleInformation(
      FilePathAndroidBitmap(bigPicturePath), hideExpandedLargeIcon: true,
      contentTitle: title, htmlFormatContentTitle: true,
      summaryText: body, htmlFormatSummaryText: true,
    );
    final AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'efood', 'efood',
      largeIcon: FilePathAndroidBitmap(largeIconPath), priority: Priority.max, playSound: true,
      styleInformation: bigPictureStyleInformation, importance: Importance.max,
      sound: RawResourceAndroidNotificationSound('notification'),
    );
    final NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
    await fln.show(0, title, body, platformChannelSpecifics, payload: orderID);
  }

  static Future<String> _downloadAndSaveFile(String url, String fileName) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$fileName';
    final http.Response response = await http.get(Uri.parse(url));
    final File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }

}

Future<dynamic> myBackgroundMessageHandler(RemoteMessage message) async {
  print("onBackground: ${message.notification?.title}/${message.notification?.body}/${message.notification?.titleLocKey}");
  // var androidInitialize = new AndroidInitializationSettings('notification_icon');
  // var iOSInitialize = new IOSInitializationSettings();
  // var initializationsSettings = new InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
  // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  // flutterLocalNotificationsPlugin.initialize(initializationsSettings);
  // NotificationHelper.showNotification(message, flutterLocalNotificationsPlugin, true);
}