import 'package:efood_kitchen/util/dimensions.dart';
import 'package:efood_kitchen/util/images.dart';
import 'package:efood_kitchen/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NoDataScreen extends StatelessWidget {
  final bool isDetails;

  const NoDataScreen({super.key, this.isDetails = false});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(isDetails? Images.select_order :
              Images.no_data_found, width: 50, height: 50,color: isDetails?
              Theme.of(context).hintColor:null,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT),
            child: Text(isDetails? 'select_order_to_see_details'.tr : 'no_data_found'.tr,
              style: robotoMedium.copyWith(color: Theme.of(context).primaryColor, fontSize: Dimensions.fontSizeLarge),
              textAlign: TextAlign.center,
            ),
          ),

        ]),
      ),
    );
  }
}
