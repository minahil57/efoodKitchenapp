import 'package:efood_kitchen/data/model/response/language_model.dart';
import 'package:efood_kitchen/util/images.dart';

class AppConstants {
  static const String APP_NAME = 'Kitchen App';
  static const double APP_VERSION = 1.1;

  // demo
  static const String BASE_URL = 'https://efood-admin.6amtech.com';
  static const String CONFIG_URI = '/api/v1/config';
  static const String LOGIN_URI = '/api/v1/auth/kitchen/login';
  static const String PROFILE_URI = '/api/v1/kitchen/profile';
  static const String ORDER_LIST = '/api/v1/kitchen/order/list';
  static const String ORDER_DETAILS = '/api/v1/kitchen/order/details';
  static const String ORDER_STATUS_UPDATE = '/api/v1/kitchen/order/status';
  static const String SEARCH_ORDER = '/api/v1/kitchen/order/search?search=';
  static const String FILTER_ORDER = '/api/v1/kitchen/order/filter?order_status=';
  static const String FCM_TOKEN_URI = '/api/v1/kitchen/update-fcm-token';

  // Shared Key
  static const String THEME = 'theme';
  static const String TOKEN = 'token';
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';
  static const String CART_LIST = 'cart_list';
  static const String USER_PASSWORD = 'user_password';
  static const String USER_ADDRESS = 'user_address';
  static const String USER_NUMBER = 'user_number';
  static const String SEARCH_ADDRESS = 'search_address';
  static const String TOPIC = 'kitchen';
  static const String BRANCH_ID = 'branch_id';

  static List<LanguageModel> languages = [
    LanguageModel(imageUrl: Images.united_kingdom, languageName: 'English', countryCode: 'US', languageCode: 'en'),
    LanguageModel(imageUrl: Images.saudi, languageName: 'Arabic', countryCode: 'SA', languageCode: 'ar'),
  ];
}
