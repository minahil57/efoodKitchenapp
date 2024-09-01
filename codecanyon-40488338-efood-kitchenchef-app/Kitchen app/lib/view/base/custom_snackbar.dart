import 'package:efood_kitchen/helper/responsive_helper.dart';
import 'package:efood_kitchen/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackBar(String message, {bool isError = true}) {
  if(message.isNotEmpty) {
    Get.showSnackbar(GetSnackBar(
      backgroundColor: isError ? Colors.red : Colors.green,
      message: message,
      maxWidth: Dimensions.WEB_MAX_WIDTH,
      duration: Duration(seconds: 3),
      snackStyle: SnackStyle.FLOATING,
      margin: ResponsiveHelper.isTab(Get.context)? EdgeInsets.symmetric(horizontal : Get.width/4) : EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
      borderRadius: Dimensions.RADIUS_SMALL,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
    ));
  }
}