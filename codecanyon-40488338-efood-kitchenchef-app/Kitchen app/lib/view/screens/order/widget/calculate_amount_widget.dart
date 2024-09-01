import 'package:efood_kitchen/controller/order_controller.dart';
import 'package:efood_kitchen/data/model/response/order_details_model.dart';
import 'package:efood_kitchen/helper/price_converter.dart';
import 'package:efood_kitchen/helper/responsive_helper.dart';
import 'package:efood_kitchen/util/dimensions.dart';
import 'package:efood_kitchen/util/styles.dart';
import 'package:efood_kitchen/view/base/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculateAmountWidget extends StatelessWidget {
  final OrderController orderController;
  const CalculateAmountWidget({Key? key, required this.orderController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deliveryCharge = orderController.orderDetails.order.deliveryCharge?.toDouble() ?? 0;
    double couponDiscount = orderController.orderDetails.order.couponDiscountAmount?.toDouble() ?? 0;
    double _extraDiscount = orderController.orderDetails.order.extraDiscount?.toDouble() ?? 0;
    double _itemsPrice = 0;
    double _discount = 0;
    double _tax = 0;
    double _addOns = 0;

    for(Details orderDetails in orderController.orderDetails.details) {
      int _index = 0;
      _itemsPrice = _itemsPrice + (orderDetails.price! * orderDetails.quantity!);
      _discount = _discount + (orderDetails.discountOnProduct! * orderDetails.quantity!);
      _tax = _tax + (orderDetails.taxAmount! * orderDetails.quantity!);

      List<AddOns> _addonsData  = orderDetails.productDetails == null ? [] :
      orderDetails.productDetails!.addOns == null ? [] : orderDetails.productDetails!.addOns!;


      try{
        List _qnt = orderDetails.addOnQtys ?? [];
        List _ids = orderDetails.addOnIds ?? [];
        for(AddOns addOn in _addonsData) {
          if(_ids.contains(addOn.id)) {
            _addOns = _addOns + (addOn.price! * _qnt[_index]);
            _index++;
          }
        }

      }catch(error){
      }

    }



    double _subTotal = _itemsPrice;
    double _total = _itemsPrice + _addOns - _discount + _tax + deliveryCharge - couponDiscount;


    return Container(child: Column(children: [
      CalculateItem(title: 'items_price',amount: _subTotal),
      if(couponDiscount > 0) CalculateItem(title: 'coupon_discount',amount: couponDiscount, isDiscount: true),
      CalculateItem(title: 'addons_price',amount: _addOns),
      CalculateItem(title: 'discount',amount: _discount, isDiscount: true),
      if( _extraDiscount > 0) CalculateItem(title: 'extra_discount'.tr,amount: _extraDiscount, isDiscount: true),

      CalculateItem(title: 'vat_tax',amount: _tax),
     if(deliveryCharge > 0) CalculateItem(title: 'delivery_charge',amount: deliveryCharge),
      CustomDivider(),
      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
      CalculateItem(title: 'total',amount: _total, isTotal: true),
    ],),);
  }
}
class CalculateItem extends StatelessWidget {
  final String title;
  final double amount;
  final bool isTotal;
  final bool isDiscount;
  const CalculateItem({
    Key? key, required this.title, required this.amount,
    this.isTotal = false, this.isDiscount = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool _isSmall =  ResponsiveHelper.isSmallTab();
    return Padding(
      padding:  EdgeInsets.only(
        bottom: _isSmall ?
        Dimensions.PADDING_SIZE_EXTRA_SMALL : Dimensions.PADDING_SIZE_DEFAULT,
      ),
      child: Container(child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        isTotal?
        Text(title.tr, style: robotoBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge)):
        Text(title.tr, style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeLarge)),

        isTotal?
        Text(PriceConverter.convertPrice(context, amount),
          style: robotoBold.copyWith(fontSize: Dimensions.fontSizeLarge),
        ):Text('${isDiscount ? '(-) ' : ''}${PriceConverter.convertPrice(context, amount)}',
          style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeLarge),
        ),
      ]),),
    );
  }
}
