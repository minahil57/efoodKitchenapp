
import 'package:efood_kitchen/controller/order_controller.dart';
import 'package:efood_kitchen/data/model/response/order_model.dart';
import 'package:efood_kitchen/helper/date_converter.dart';
import 'package:efood_kitchen/helper/responsive_helper.dart';
import 'package:efood_kitchen/util/dimensions.dart';
import 'package:efood_kitchen/util/images.dart';
import 'package:efood_kitchen/util/styles.dart';
import 'package:efood_kitchen/view/screens/order/order_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderCardWidget extends StatelessWidget {
  final Orders order;
  const OrderCardWidget({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      builder: (orderController) {
        return InkWell(
          onTap: (){
            if(ResponsiveHelper.isTab(context)){
              orderController.setOrderIdForOrderDetails(order.id!, order.orderStatus!, order.orderNote);
              orderController.getOrderDetails(order.id!);
            }else{
              Get.to(OrderDetailsScreen(orderId: order.id!));
            }
          },
          child: Container(
            margin: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
              decoration: BoxDecoration(
              color:Theme.of(context).cardColor,
              boxShadow: orderController.orderId == order.id?
              [BoxShadow(color: Theme.of(context).primaryColor, blurRadius: 2, spreadRadius: .5, offset: Offset(0,0))]:
              [BoxShadow(color: Get.isDarkMode ? Colors.grey[900]! :Colors.grey[300]!, blurRadius: 5, spreadRadius: 1, offset: Offset(0,2))],
              borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_SMALL)
          ),child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              // width: MediaQuery.of(context).size.width/2,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.PADDING_SIZE_SMALL), topRight: Radius.circular(Dimensions.PADDING_SIZE_SMALL)),
                 boxShadow: [BoxShadow(color:Get.isDarkMode ? Colors.grey[900]!: Colors.grey[100]!, blurRadius: 0, spreadRadius: .5, offset: Offset(0,3))],

              ),
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                  vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL,
              ),
              child: Center(
                child: Text('${'order_id'.tr} #${order.id}', style: robotoMedium.copyWith(
                  fontSize: Dimensions.fontSizeDefault,
                )),
              ),
            ),


            Container(
              // width: MediaQuery.of(context).size.width/2,
              padding: EdgeInsets.fromLTRB(Dimensions.PADDING_SIZE_EXTRA_SMALL, 0,
                Dimensions.PADDING_SIZE_EXTRA_SMALL,Dimensions.PADDING_SIZE_EXTRA_SMALL,
              ),
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Center(
                              child: Text(order.orderType =="delivery"?
                              '${'home_delivery'.tr}' : order.orderType =="take_away"?
                              '${'take_away'.tr}':'${'dine_in'.tr}' , style: robotoMedium.copyWith(
                                  fontSize: Dimensions.fontSizeDefault)),
                            ),
                        ),

                            Image.asset(
                                height: 25,width: 25, order.orderType =="delivery"?
                            Images.home_delivery : order.orderType =="take_away"? Images.take_away : Images.dine_in,
                            ),
                      ],
                    )
                  ),


                  Container(
                      width: MediaQuery.of(context).size.width/2,
                      decoration: BoxDecoration(
                      color: order.orderStatus == 'confirmed' ? Theme.of(context).colorScheme.primary.withOpacity(.15):
                      order.orderStatus == 'cooking' ? Theme.of(context).primaryColor.withOpacity(.15):Theme.of(context).secondaryHeaderColor.withOpacity(.15),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(Dimensions.PADDING_SIZE_SMALL),
                      bottomRight: Radius.circular(Dimensions.PADDING_SIZE_SMALL))),


                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                        child: Column(children: [

                          Padding(
                            padding: const EdgeInsets.only(top: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            child: Text('order_time'.tr, style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeDefault)),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            child: Text(DateConverter.isoStringToLocalDateOnly(order.createdAt!), style: robotoRegular),
                          ),
                          Text(DateConverter.isoStringToLocalTimeOnly(order.createdAt!), style: robotoRegular),
                          SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),


                          Text('${order.orderStatus}'.tr, style: robotoMedium.copyWith(
                              color: order.orderStatus == 'confirmed' ? Theme.of(context).colorScheme.primary:
                              order.orderStatus == 'cooking' ? Theme.of(context).primaryColor:Theme.of(context).secondaryHeaderColor,
                              fontSize: Dimensions.fontSizeDefault)),
                          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                    ],
                  ),
                      )),
                ],
              ),
            ),



          ],)),
        );
      }
    );
  }
}