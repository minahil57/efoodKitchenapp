import 'package:efood_kitchen/controller/splash_controller.dart';
import 'package:efood_kitchen/helper/responsive_helper.dart';
import 'package:efood_kitchen/util/dimensions.dart';
import 'package:efood_kitchen/util/images.dart';
import 'package:efood_kitchen/view/base/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String icon;
  final bool isBackButtonExist;
  final Function? onBackPressed;
  final bool showCart;
  CustomAppBar({required this.icon, this.isBackButtonExist = true,  this.onBackPressed, this.showCart = false});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isTab(context)
        ? TabAppBar()  : AppBar(
      title: Image.asset(icon),
      centerTitle: true,
      leading: isBackButtonExist ? IconButton(
        icon: Icon(Icons.arrow_back_ios),
        color: Theme.of(context).textTheme.bodyText1!.color,
        onPressed: () => onBackPressed != null ? onBackPressed!() : Navigator.pop(context),
      ) : SizedBox(),
      backgroundColor: Theme.of(context).cardColor,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size(Dimensions.WEB_MAX_WIDTH, GetPlatform.isDesktop ? 70 : 50);
}

class TabAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TabAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).cardColor.withOpacity(0.1),
                  offset: Offset(0, 6),
                  blurRadius: 12,
                  spreadRadius: -3,
                ),
              ]),
          child: Row(children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT,),
              child: CustomImage(
                image: '${Get.find<SplashController>().configModel.baseUrls?.restaurantImageUrl}/${
                  Get.find<SplashController>().configModel.restaurantLogo}',
                height: 50, placeholder: Images.logo,
              ),
            ),
            SizedBox(width: Dimensions.PADDING_SIZE_LARGE),

            Flexible(child: Container(height: ResponsiveHelper.isSmallTab() ? 50 : 70, color: Theme.of(context).primaryColor, ))

          ],),
        ),
      ],),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
