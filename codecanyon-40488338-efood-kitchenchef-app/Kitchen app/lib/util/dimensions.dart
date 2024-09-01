import 'package:efood_kitchen/helper/responsive_helper.dart';

class Dimensions {
  static double fontSizeExtraSmall = ResponsiveHelper.isSmallTab() ? 5 : 8;
  static double fontSizeSmall = ResponsiveHelper.isSmallTab() ? 8 : 10;
  static double fontSizeDefault = ResponsiveHelper.isSmallTab() ? 12 : 14;
  static double fontSizeLarge = ResponsiveHelper.isSmallTab() ? 14 : 16;
  static double fontSizeExtraLarge = ResponsiveHelper.isSmallTab() ? 16 : 18;
  static double fontSizeOverLarge = ResponsiveHelper.isSmallTab() ? 20 : 24;

  static const double PADDING_SIZE_TINY_SMALL = 2.0;
  static const double PADDING_SIZE_EXTRA_SMALL = 5.0;
  static const double PADDING_SIZE_TABS = 7.0;
  static const double PADDING_SIZE_SMALL = 10.0;
  static const double PADDING_SIZE_DEFAULT = 15.0;
  static const double PADDING_SIZE_LARGE = 20.0;
  static const double PADDING_SIZE_EXTRA_LARGE = 25.0;

  static const double RADIUS_SMALL = 5.0;
  static const double RADIUS_DEFAULT = 10.0;
  static const double RADIUS_LARGE = 15.0;
  static const double RADIUS_EXTRA_LARGE = 20.0;

  static const double ICON_SIZE = 20.0;
  static const double STATUS_UPDATE_BUTTON_WEIGHT = 350.0;
  static const double STATUS_UPDATE_BUTTON_HEIGHT = 70.0;

  static const double WEB_MAX_WIDTH = 1170;
}