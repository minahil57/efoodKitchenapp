import 'package:efood_kitchen/helper/responsive_helper.dart';
import 'package:efood_kitchen/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
class OrderShimmer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _isMobile = (Get.height / Get.width) > 1 && (Get.height / Get.width) < 1.7;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:  ResponsiveHelper.isSmallTab() || _isMobile ? 3 :  !ResponsiveHelper.isTab(context)  ? 2 : 4,
        childAspectRatio: MediaQuery.of(context).size.width>1200? 1/.77 : 1/1.2,
      ),
      itemCount: 20,
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).highlightColor,
            boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), spreadRadius: 1, blurRadius: 5)],
          ),
          child: Shimmer.fromColors(
            baseColor:Get.isDarkMode ? Colors.grey[900]! :  Colors.grey[300]!,
            highlightColor: Get.isDarkMode ? Colors.grey[700]! : Colors.grey[100]!,
            enabled: true,
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              // Product Image
              Expanded(
                flex: 6,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  ),
                ),
              ),

              // Product Details
              Expanded(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(height: 20, color: Get.isDarkMode ? Colors.grey[900]! : Colors.white),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      Row(children: [
                        Expanded(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Container(height: 20, width: 50, color: Get.isDarkMode ? Colors.grey[900]! : Colors.white),
                          ]),
                        ),
                        Container(height: 10, width: 50, color:Get.isDarkMode ? Colors.grey[900]! :  Colors.white),
                        Icon(Icons.star, color: Colors.orange, size: 15),
                      ]),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
