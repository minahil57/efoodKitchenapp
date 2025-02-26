import 'package:efood_kitchen/controller/order_controller.dart';
import 'package:efood_kitchen/util/dimensions.dart';
import 'package:efood_kitchen/util/styles.dart';
import 'package:efood_kitchen/view/base/custom_divider.dart';
import 'package:efood_kitchen/view/base/custom_loader.dart';
import 'package:efood_kitchen/view/base/no_data_screen.dart';
import 'package:efood_kitchen/view/screens/home/widget/status_change_custom_button.dart';
import 'package:efood_kitchen/view/screens/order/widget/calculate_amount_widget.dart';
import 'package:efood_kitchen/view/screens/order/widget/ordered_product_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabOrderDetailsWidget extends StatefulWidget {
  final int  orderId;
  final String orderStatus;
  final String orderNote;

  const TabOrderDetailsWidget({Key? key, required this.orderId, required this.orderStatus, required this.orderNote}) : super(key: key);

  @override
  State<TabOrderDetailsWidget> createState() => _TabOrderDetailsWidgetState();
}

class _TabOrderDetailsWidgetState extends State<TabOrderDetailsWidget> {
  @override
  void initState() {
      if(widget.orderId != 0){
        Get.find<OrderController>().getOrderDetails(widget.orderId);
      }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return widget.orderId == 0 ? NoDataScreen(isDetails: true,) : GetBuilder<OrderController>(
        builder: (orderDetailsController) {
          return orderDetailsController.isDetails?
          CustomLoader():
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.PADDING_SIZE_DEFAULT,
              right: Dimensions.PADDING_SIZE_DEFAULT,
              top: Dimensions.PADDING_SIZE_DEFAULT,
              bottom: 0,
            ),

            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL),
                child: Text('order_summery'.tr, style: robotoMedium.copyWith(color: Theme.of(context).primaryColor,
                    fontSize: Dimensions.fontSizeLarge)),
              ),
              orderDetailsController.isDetails? SizedBox() :
              Row(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${'order'.tr}# ${orderDetailsController.orderDetails.order.id.toString()}',style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeLarge),),
                      Row(
                        children: [
                          orderDetailsController.orderDetails.order.table != null ?
                          Text('${'table'.tr} ${orderDetailsController.orderDetails.order.table!.number!}',
                              style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeLarge)):SizedBox(),

                          orderDetailsController.orderDetails.order.numberOfPeople > 0 ?
                          Text(' | ${orderDetailsController.orderDetails.order.numberOfPeople} ${'people'.tr}') :
                          SizedBox(),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
             Expanded(child: OrderedProductList(orderController: orderDetailsController)),


              Padding(
                padding: const EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL),
                child: Container(
                  child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${'note'.tr}: ", style: robotoBold),
                      Expanded(child: Text(widget.orderNote, maxLines: 5,overflow: TextOverflow.clip,)),
                    ],
                  ),
                ),
              ),

              CustomDivider(),
              SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
              Container( child: CalculateAmountWidget(orderController: orderDetailsController)),
              Align(
                alignment: Alignment.bottomCenter,
                child: StatusChangeCustomButton(
                  orderId: widget.orderId,
                  orderStatus: widget.orderStatus,
                ),
              ),
            ],),);
        }
    );

  }
}
