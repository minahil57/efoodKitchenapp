import 'dart:async';
import 'package:efood_kitchen/data/api/api_client.dart';
import 'package:efood_kitchen/util/app_constants.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';



class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> login(String phone, String password) async {
    return await apiClient.postData(AppConstants.LOGIN_URI,
        {"email_or_phone": phone, "password": password});
  }
  Future<Response> profile () async {
    return await apiClient.getData(AppConstants.PROFILE_URI);
  }


  Future<bool?> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }



  Future<void> saveBranchId(String branchId) async {
    try {
      await sharedPreferences.setString(AppConstants.BRANCH_ID, branchId);
    } catch (e) {
      rethrow;
    }
  }


  String getBranchId() {
    return sharedPreferences.getString(AppConstants.BRANCH_ID) ?? "";
  }


  Future<Response?> updateToken(String branchId) async {
    print("inside_update_token");
    String? _deviceToken;
    if (GetPlatform.isIOS) {
      FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);
      NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
        alert: true, announcement: false, badge: true, carPlay: false,
        criticalAlert: false, provisional: false, sound: true,
      );
      if(settings.authorizationStatus == AuthorizationStatus.authorized) {
        _deviceToken = await _saveDeviceToken();
      }

    }else {
      _deviceToken = await _saveDeviceToken();
    }
    if(!GetPlatform.isWeb) {

      print('branch Id=========>${'${AppConstants.TOPIC}-$branchId'}');
      print('device token=========>$_deviceToken');
      FirebaseMessaging.instance.subscribeToTopic('${AppConstants.TOPIC}-$branchId');

    }


    return await apiClient.postData(AppConstants.FCM_TOKEN_URI, {"_method": "put", "fcm_token": _deviceToken});
  }

  Future<String?> _saveDeviceToken() async {
    String? _deviceToken = '@';
    if(!GetPlatform.isWeb) {
      try {
        _deviceToken = await FirebaseMessaging.instance.getToken();
      }catch(e) {}
    }
    if (_deviceToken != null) {
      print('--------Device Token---------- '+_deviceToken);
    }
    return _deviceToken;
  }

  String getUserToken() {
    return sharedPreferences.getString(AppConstants.TOKEN) ?? "";
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  Future<bool> clearSharedData() async {
    sharedPreferences.remove(AppConstants.TOKEN);
    FirebaseMessaging.instance.unsubscribeFromTopic(AppConstants.TOPIC);
    return true;
  }

  Future<void> saveUserNumberAndPassword(String number, String password) async {
    try {
      await sharedPreferences.setString(AppConstants.USER_PASSWORD, password);
      await sharedPreferences.setString(AppConstants.USER_NUMBER, number);
    } catch (e) {
      rethrow;
    }
  }


  Future<bool> clearUserNumberAndPassword() async {
    await sharedPreferences.remove(AppConstants.USER_PASSWORD);
    return await sharedPreferences.remove(AppConstants.USER_NUMBER);
  }

  String getUserNumber() {
    return sharedPreferences.getString(AppConstants.USER_NUMBER) ?? "";
  }

  String getUserPassword() {
    return sharedPreferences.getString(AppConstants.USER_PASSWORD) ?? "";
  }

}
