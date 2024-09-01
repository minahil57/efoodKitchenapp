import 'package:efood_kitchen/controller/order_controller.dart';
import 'package:efood_kitchen/data/model/response/order_details_model.dart';
import 'package:efood_kitchen/helper/price_converter.dart';
import 'package:efood_kitchen/helper/responsive_helper.dart';
import 'package:efood_kitchen/util/dimensions.dart';
import 'package:efood_kitchen/util/styles.dart';
import 'package:efood_kitchen/view/base/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderedProductList extends StatelessWidget {
  final OrderController orderController;
  const OrderedProductList({Key? key, required this.orderController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT),
      child: ListView.builder(
        shrinkWrap: ResponsiveHelper.isMobile(context),
        physics: ResponsiveHelper.isMobile(context) ? NeverScrollableScrollPhysics() : AlwaysScrollableScrollPhysics(),
        itemCount: orderController.orderDetails.details.length,
        itemBuilder: (context, index) {
          String _variation = '';
          List<AddOns> _addOns = [];
          List<AddOns> _addonsData  = orderController.orderDetails.details[index].productDetails == null ? [] :
          orderController.orderDetails.details[index].productDetails!.addOns == null ? [] :
          orderController.orderDetails.details[index].productDetails!.addOns!;

          try{
            _variation =   orderController.orderDetails.details[index].variation!.type!;
          }catch(e) {

          }

          _addonsData.forEach((addOn) {
            if (orderController.orderDetails.details[index].addOnIds!.contains(addOn.id)) {
              _addOns.add(addOn);
            }
          });









          return Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [Row(children: [
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Row(children: [
                      Expanded(child: Text(orderController.orderDetails.details[index].productDetails!.name!,
                        style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeDefault),
                        maxLines: 2, overflow: TextOverflow.ellipsis)),


                      Text(orderController.orderDetails.details[index].quantity.toString(), style: robotoRegular.copyWith()),
                      SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_LARGE),

                      Text(PriceConverter.convertPrice( context,
                          (orderController.orderDetails.details[index].price! * orderController.orderDetails.details[index].quantity!)),
                          style: robotoMedium.copyWith(),
                      ),
                    ],),

                      _variation.isNotEmpty ? Text(
                        '${'variation'.tr} : $_variation', style: robotoRegular,
                      ) : SizedBox(),

                     _addOns.length > 0 ? SizedBox(
                        height: 30,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _addOns.length,
                          itemBuilder: (context, _item) {
                            return Row(
                              children: [
                               if(_item == 0) Text('${'add_ons'.tr} :', style: robotoRegular),
                                SizedBox(width: 2),

                                Text(_addOns[_item].name ?? '', style: robotoRegular),
                                SizedBox(width: 2),

                                Text('(${orderController.orderDetails.details[index].addOnQtys![_item]})', style: robotoRegular),

                                if(_item + 1 != _addOns.length)Text(' - ', style: robotoRegular),
                              ],
                            );

                          },
                        ),
                      ) : SizedBox(),


                      // if(_addOnsList.isNotEmpty)

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            child: Text(PriceConverter.convertPrice( context, orderController.orderDetails.details[index].price!),
                                style: robotoRegular.copyWith(color: Theme.of(context).hintColor))),

                         if(orderController.orderDetails.details[index].productDetails!.productType != null) Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(Dimensions.RADIUS_SMALL)),
                              color: Theme.of(context).primaryColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0 ,vertical: 2),
                              child: Text('${orderController.orderDetails.details[index].productDetails!.productType}'.tr, style: robotoRegular.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                    ]),
              ),
            ]),
              Padding(
                padding: const EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL),
                child: const CustomDivider(height: .25,),
              ),
            ]);
      },
    ),);
  }
}
