import 'package:efood_kitchen/controller/order_controller.dart';
import 'package:efood_kitchen/data/model/response/order_model.dart';
import 'package:efood_kitchen/helper/responsive_helper.dart';
import 'package:efood_kitchen/util/dimensions.dart';
import 'package:efood_kitchen/view/base/no_data_screen.dart';
import 'package:efood_kitchen/view/base/order_shimmer.dart';
import 'package:efood_kitchen/view/screens/home/widget/order_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class OrderListView extends StatelessWidget {

  const OrderListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _isMobile = (Get.height / Get.width) > 1 && (Get.height / Get.width) < 1.7;
    return RefreshIndicator(
      color: Theme.of(context).cardColor,
      backgroundColor: Theme.of(context).primaryColor,
      onRefresh: () async {
        await Get.find<OrderController>().getOrderList(1);
      },
      child: GetBuilder<OrderController>(
        builder: (orderController) {
          List<Orders>? orderList = orderController.orderList ;
          print('-----------------width : ${context.width}----------------------------');

          return Padding(
            padding: const EdgeInsets.only(
              right: Dimensions.PADDING_SIZE_DEFAULT,
              top: Dimensions.PADDING_SIZE_DEFAULT,
              left: Dimensions.PADDING_SIZE_DEFAULT,
            ),
            child: Column(children: [

              orderList != null ? orderList.length > 0 ?
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  controller: orderController.scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: ResponsiveHelper.isSmallTab() || _isMobile ? 3 :  !ResponsiveHelper.isTab(context)  ? 2 : 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: ResponsiveHelper.isTab(context) ? 1 : 1/1.2 ,
                  ),
                  padding: EdgeInsets.all(0),
                  itemCount: orderList.length,
                  itemBuilder: (context, index) {

                    return OrderCardWidget(order: orderList[index]);
                  },
                ),
              )
                : NoDataScreen() : Expanded(child: OrderShimmer()),


              orderController.isLoading && orderController.orderList != null ? Center(child: Padding(
                padding: EdgeInsets.all(Dimensions.ICON_SIZE),
                child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
              )) : SizedBox.shrink(),

            ]),
          );
        },
      ),
    );
  }
}
//order: orderList[index]