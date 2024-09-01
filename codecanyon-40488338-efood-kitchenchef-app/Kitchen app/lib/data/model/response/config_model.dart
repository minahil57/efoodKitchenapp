class ConfigModel {
  String? _restaurantName;
  List<RestaurantScheduleTime>? _restaurantScheduleTime;
  String? _restaurantLogo;
  String? _restaurantAddress;
  String? _restaurantPhone;
  String? _restaurantEmail;
  RestaurantLocationCoverage? _restaurantLocationCoverage;
  int? _minimumOrderValue;
  BaseUrls? _baseUrls;
  String? _currencySymbol;
  int? _deliveryCharge;
  DeliveryManagement? _deliveryManagement;
  String? _cashOnDelivery;
  String? _digitalPayment;
  List<Branches>? _branches;
  String? _termsAndConditions;
  String? _privacyPolicy;
  String? _aboutUs;
  bool? _emailVerification;
  bool? _phoneVerification;
  String? _currencySymbolPosition;
  bool? _maintenanceMode;
  String? _country;
  bool? _selfPickup;
  bool? _delivery;
  PlayStoreConfig? _playStoreConfig;
  PlayStoreConfig? _appStoreConfig;
  List<SocialMediaLink>? _socialMediaLink;
  String? _softwareVersion;
  String? _footerText;
  int? _decimalPointSettings;
  int? _scheduleOrderSlotDuration;
  String? _timeFormat;

  ConfigModel(
      {String? restaurantName,
        List<RestaurantScheduleTime>? restaurantScheduleTime,
        String? restaurantLogo,
        String? restaurantAddress,
        String? restaurantPhone,
        String? restaurantEmail,
        RestaurantLocationCoverage? restaurantLocationCoverage,
        int? minimumOrderValue,
        BaseUrls? baseUrls,
        String? currencySymbol,
        int? deliveryCharge,
        DeliveryManagement? deliveryManagement,
        String? cashOnDelivery,
        String? digitalPayment,
        List<Branches>? branches,
        String? termsAndConditions,
        String? privacyPolicy,
        String? aboutUs,
        bool? emailVerification,
        bool? phoneVerification,
        String? currencySymbolPosition,
        bool? maintenanceMode,
        String? country,
        bool? selfPickup,
        bool? delivery,
        PlayStoreConfig? playStoreConfig,
        PlayStoreConfig? appStoreConfig,
        List<SocialMediaLink>? socialMediaLink,
        String? softwareVersion,
        String? footerText,
        int? decimalPointSettings,
        int? scheduleOrderSlotDuration,
        String? timeFormat}) {
    if (restaurantName != null) {
      this._restaurantName = restaurantName;
    }
    if (restaurantScheduleTime != null) {
      this._restaurantScheduleTime = restaurantScheduleTime;
    }
    if (restaurantLogo != null) {
      this._restaurantLogo = restaurantLogo;
    }
    if (restaurantAddress != null) {
      this._restaurantAddress = restaurantAddress;
    }
    if (restaurantPhone != null) {
      this._restaurantPhone = restaurantPhone;
    }
    if (restaurantEmail != null) {
      this._restaurantEmail = restaurantEmail;
    }
    if (restaurantLocationCoverage != null) {
      this._restaurantLocationCoverage = restaurantLocationCoverage;
    }
    if (minimumOrderValue != null) {
      this._minimumOrderValue = minimumOrderValue;
    }
    if (baseUrls != null) {
      this._baseUrls = baseUrls;
    }
    if (currencySymbol != null) {
      this._currencySymbol = currencySymbol;
    }
    if (deliveryCharge != null) {
      this._deliveryCharge = deliveryCharge;
    }
    if (deliveryManagement != null) {
      this._deliveryManagement = deliveryManagement;
    }
    if (cashOnDelivery != null) {
      this._cashOnDelivery = cashOnDelivery;
    }
    if (digitalPayment != null) {
      this._digitalPayment = digitalPayment;
    }
    if (branches != null) {
      this._branches = branches;
    }
    if (termsAndConditions != null) {
      this._termsAndConditions = termsAndConditions;
    }
    if (privacyPolicy != null) {
      this._privacyPolicy = privacyPolicy;
    }
    if (aboutUs != null) {
      this._aboutUs = aboutUs;
    }
    if (emailVerification != null) {
      this._emailVerification = emailVerification;
    }
    if (phoneVerification != null) {
      this._phoneVerification = phoneVerification;
    }
    if (currencySymbolPosition != null) {
      this._currencySymbolPosition = currencySymbolPosition;
    }
    if (maintenanceMode != null) {
      this._maintenanceMode = maintenanceMode;
    }
    if (country != null) {
      this._country = country;
    }
    if (selfPickup != null) {
      this._selfPickup = selfPickup;
    }
    if (delivery != null) {
      this._delivery = delivery;
    }
    if (playStoreConfig != null) {
      this._playStoreConfig = playStoreConfig;
    }
    if (appStoreConfig != null) {
      this._appStoreConfig = appStoreConfig;
    }
    if (socialMediaLink != null) {
      this._socialMediaLink = socialMediaLink;
    }
    if (softwareVersion != null) {
      this._softwareVersion = softwareVersion;
    }
    if (footerText != null) {
      this._footerText = footerText;
    }
    if (decimalPointSettings != null) {
      this._decimalPointSettings = decimalPointSettings;
    }
    if (scheduleOrderSlotDuration != null) {
      this._scheduleOrderSlotDuration = scheduleOrderSlotDuration;
    }
    if (timeFormat != null) {
      this._timeFormat = timeFormat;
    }
  }

  String? get restaurantName => _restaurantName;
  List<RestaurantScheduleTime>? get restaurantScheduleTime => _restaurantScheduleTime;
  String? get restaurantLogo => _restaurantLogo;
  String? get restaurantAddress => _restaurantAddress;
  String? get restaurantPhone => _restaurantPhone;
  String? get restaurantEmail => _restaurantEmail;
  RestaurantLocationCoverage? get restaurantLocationCoverage => _restaurantLocationCoverage;
  int? get minimumOrderValue => _minimumOrderValue;
  BaseUrls? get baseUrls => _baseUrls;
  String? get currencySymbol => _currencySymbol;
  int? get deliveryCharge => _deliveryCharge;
  DeliveryManagement? get deliveryManagement => _deliveryManagement;
  String? get cashOnDelivery => _cashOnDelivery;
  String? get digitalPayment => _digitalPayment;
  List<Branches>? get branches => _branches;
  String? get termsAndConditions => _termsAndConditions;
  String? get privacyPolicy => _privacyPolicy;
  String? get aboutUs => _aboutUs;
  bool? get emailVerification => _emailVerification;
  bool? get phoneVerification => _phoneVerification;
  String? get currencySymbolPosition => _currencySymbolPosition;
  bool? get maintenanceMode => _maintenanceMode;
  String? get country => _country;
  bool? get selfPickup => _selfPickup;
  bool? get delivery => _delivery;
  PlayStoreConfig? get playStoreConfig => _playStoreConfig;
  PlayStoreConfig? get appStoreConfig => _appStoreConfig;
  List<SocialMediaLink>? get socialMediaLink => _socialMediaLink;
  String? get softwareVersion => _softwareVersion;
  String? get footerText => _footerText;
  int? get decimalPointSettings => _decimalPointSettings;
  int? get scheduleOrderSlotDuration => _scheduleOrderSlotDuration;
  String? get timeFormat => _timeFormat;


  ConfigModel.fromJson(Map<String, dynamic> json) {
    _restaurantName = json['restaurant_name'];
    if (json['restaurant_schedule_time'] != null) {
      _restaurantScheduleTime = <RestaurantScheduleTime>[];
      json['restaurant_schedule_time'].forEach((v) {
        _restaurantScheduleTime!.add(new RestaurantScheduleTime.fromJson(v));
      });
    }
    _restaurantLogo = json['restaurant_logo'];
    _restaurantAddress = json['restaurant_address'];
    _restaurantPhone = json['restaurant_phone'];
    _restaurantEmail = json['restaurant_email'];
    _restaurantLocationCoverage = json['restaurant_location_coverage'] != null
        ? new RestaurantLocationCoverage.fromJson(
        json['restaurant_location_coverage'])
        : null;
    _minimumOrderValue = json['minimum_order_value'];
    _baseUrls = json['base_urls'] != null
        ? new BaseUrls.fromJson(json['base_urls'])
        : null;
    _currencySymbol = json['currency_symbol'];
    _deliveryCharge = json['delivery_charge'];
    _deliveryManagement = json['delivery_management'] != null
        ? new DeliveryManagement.fromJson(json['delivery_management'])
        : null;
    _cashOnDelivery = json['cash_on_delivery'];
    _digitalPayment = json['digital_payment'];
    if (json['branches'] != null) {
      _branches = <Branches>[];
      json['branches'].forEach((v) {
        _branches!.add(new Branches.fromJson(v));
      });
    }
    _termsAndConditions = json['terms_and_conditions'];
    _privacyPolicy = json['privacy_policy'];
    _aboutUs = json['about_us'];
    _emailVerification = json['email_verification'];
    _phoneVerification = json['phone_verification'];
    _currencySymbolPosition = json['currency_symbol_position'];
    _maintenanceMode = json['maintenance_mode'];
    _country = json['country'];
    _selfPickup = json['self_pickup'];
    _delivery = json['delivery'];
    _playStoreConfig = json['play_store_config'] != null
        ? new PlayStoreConfig.fromJson(json['play_store_config'])
        : null;
    _appStoreConfig = json['app_store_config'] != null
        ? new PlayStoreConfig.fromJson(json['app_store_config'])
        : null;
    if (json['social_media_link'] != null) {
      _socialMediaLink = <SocialMediaLink>[];
      json['social_media_link'].forEach((v) {
        _socialMediaLink!.add(new SocialMediaLink.fromJson(v));
      });
    }
    _softwareVersion = json['software_version'];
    _footerText = json['footer_text'];
    _decimalPointSettings = json['decimal_point_settings'];
    _scheduleOrderSlotDuration = json['schedule_order_slot_duration'];
    _timeFormat = json['time_format'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['restaurant_name'] = this._restaurantName;
    if (this._restaurantScheduleTime != null) {
      data['restaurant_schedule_time'] =
          this._restaurantScheduleTime!.map((v) => v.toJson()).toList();
    }
    data['restaurant_logo'] = this._restaurantLogo;
    data['restaurant_address'] = this._restaurantAddress;
    data['restaurant_phone'] = this._restaurantPhone;
    data['restaurant_email'] = this._restaurantEmail;
    if (this._restaurantLocationCoverage != null) {
      data['restaurant_location_coverage'] =
          this._restaurantLocationCoverage!.toJson();
    }
    data['minimum_order_value'] = this._minimumOrderValue;
    if (this._baseUrls != null) {
      data['base_urls'] = this._baseUrls!.toJson();
    }
    data['currency_symbol'] = this._currencySymbol;
    data['delivery_charge'] = this._deliveryCharge;
    if (this._deliveryManagement != null) {
      data['delivery_management'] = this._deliveryManagement!.toJson();
    }
    data['cash_on_delivery'] = this._cashOnDelivery;
    data['digital_payment'] = this._digitalPayment;
    if (this._branches != null) {
      data['branches'] = this._branches!.map((v) => v.toJson()).toList();
    }
    data['terms_and_conditions'] = this._termsAndConditions;
    data['privacy_policy'] = this._privacyPolicy;
    data['about_us'] = this._aboutUs;
    data['email_verification'] = this._emailVerification;
    data['phone_verification'] = this._phoneVerification;
    data['currency_symbol_position'] = this._currencySymbolPosition;
    data['maintenance_mode'] = this._maintenanceMode;
    data['country'] = this._country;
    data['self_pickup'] = this._selfPickup;
    data['delivery'] = this._delivery;
    if (this._playStoreConfig != null) {
      data['play_store_config'] = this._playStoreConfig!.toJson();
    }
    if (this._appStoreConfig != null) {
      data['app_store_config'] = this._appStoreConfig!.toJson();
    }
    if (this._socialMediaLink != null) {
      data['social_media_link'] =
          this._socialMediaLink!.map((v) => v.toJson()).toList();
    }
    data['software_version'] = this._softwareVersion;
    data['footer_text'] = this._footerText;
    data['decimal_point_settings'] = this._decimalPointSettings;
    data['schedule_order_slot_duration'] = this._scheduleOrderSlotDuration;
    data['time_format'] = this._timeFormat;
    return data;
  }
}

class RestaurantScheduleTime {
  int? _day;
  String? _openingTime;
  String? _closingTime;

  RestaurantScheduleTime({int? day, String? openingTime, String? closingTime}) {
    if (day != null) {
      this._day = day;
    }
    if (openingTime != null) {
      this._openingTime = openingTime;
    }
    if (closingTime != null) {
      this._closingTime = closingTime;
    }
  }

  int? get day => _day;
  String? get openingTime => _openingTime;
  String? get closingTime => _closingTime;


  RestaurantScheduleTime.fromJson(Map<String, dynamic> json) {
    _day = json['day'];
    _openingTime = json['opening_time'];
    _closingTime = json['closing_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this._day;
    data['opening_time'] = this._openingTime;
    data['closing_time'] = this._closingTime;
    return data;
  }
}

class RestaurantLocationCoverage {
  String? _longitude;
  String? _latitude;
  int? _coverage;

  RestaurantLocationCoverage(
      {String? longitude, String? latitude, int? coverage}) {
    if (longitude != null) {
      this._longitude = longitude;
    }
    if (latitude != null) {
      this._latitude = latitude;
    }
    if (coverage != null) {
      this._coverage = coverage;
    }
  }

  String? get longitude => _longitude;
  String? get latitude => _latitude;
  int? get coverage => _coverage;


  RestaurantLocationCoverage.fromJson(Map<String, dynamic> json) {
    _longitude = json['longitude'];
    _latitude = json['latitude'];
    _coverage = json['coverage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['longitude'] = this._longitude;
    data['latitude'] = this._latitude;
    data['coverage'] = this._coverage;
    return data;
  }
}

class BaseUrls {
  String? _productImageUrl;
  String? _customerImageUrl;
  String? _bannerImageUrl;
  String? _categoryImageUrl;
  String? _categoryBannerImageUrl;
  String? _reviewImageUrl;
  String? _notificationImageUrl;
  String? _restaurantImageUrl;
  String? _deliveryManImageUrl;
  String? _chatImageUrl;
  String? _kitchenProfileUrl;

  BaseUrls(
      {String? productImageUrl,
        String? customerImageUrl,
        String? bannerImageUrl,
        String? categoryImageUrl,
        String? categoryBannerImageUrl,
        String? reviewImageUrl,
        String? notificationImageUrl,
        String? restaurantImageUrl,
        String? deliveryManImageUrl,
        String? chatImageUrl,
        String? kitchenProfileUrl,
      }) {
    if (productImageUrl != null) {
      this._productImageUrl = productImageUrl;
    }
    if (customerImageUrl != null) {
      this._customerImageUrl = customerImageUrl;
    }
    if (bannerImageUrl != null) {
      this._bannerImageUrl = bannerImageUrl;
    }
    if (categoryImageUrl != null) {
      this._categoryImageUrl = categoryImageUrl;
    }
    if (categoryBannerImageUrl != null) {
      this._categoryBannerImageUrl = categoryBannerImageUrl;
    }
    if (reviewImageUrl != null) {
      this._reviewImageUrl = reviewImageUrl;
    }
    if (notificationImageUrl != null) {
      this._notificationImageUrl = notificationImageUrl;
    }
    if (restaurantImageUrl != null) {
      this._restaurantImageUrl = restaurantImageUrl;
    }
    if (deliveryManImageUrl != null) {
      this._deliveryManImageUrl = deliveryManImageUrl;
    }
    if (chatImageUrl != null) {
      this._chatImageUrl = chatImageUrl;
    }
    if (kitchenProfileUrl != null) {
      this._kitchenProfileUrl = kitchenProfileUrl;
    }
  }

  String? get productImageUrl => _productImageUrl;
  String? get customerImageUrl => _customerImageUrl;
  String? get bannerImageUrl => _bannerImageUrl;
  String? get categoryImageUrl => _categoryImageUrl;
  String? get categoryBannerImageUrl => _categoryBannerImageUrl;
  String? get reviewImageUrl => _reviewImageUrl;
  String? get notificationImageUrl => _notificationImageUrl;
  String? get restaurantImageUrl => _restaurantImageUrl;
  String? get deliveryManImageUrl => _deliveryManImageUrl;
  String? get chatImageUrl => _chatImageUrl;
  String? get kitchenProfileUrl => _kitchenProfileUrl;

  BaseUrls.fromJson(Map<String, dynamic> json) {
    _productImageUrl = json['product_image_url'];
    _customerImageUrl = json['customer_image_url'];
    _bannerImageUrl = json['banner_image_url'];
    _categoryImageUrl = json['category_image_url'];
    _categoryBannerImageUrl = json['category_banner_image_url'];
    _reviewImageUrl = json['review_image_url'];
    _notificationImageUrl = json['notification_image_url'];
    _restaurantImageUrl = json['restaurant_image_url'];
    _deliveryManImageUrl = json['delivery_man_image_url'];
    _chatImageUrl = json['chat_image_url'];
    _kitchenProfileUrl = json['kitchen_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_image_url'] = this._productImageUrl;
    data['customer_image_url'] = this._customerImageUrl;
    data['banner_image_url'] = this._bannerImageUrl;
    data['category_image_url'] = this._categoryImageUrl;
    data['category_banner_image_url'] = this._categoryBannerImageUrl;
    data['review_image_url'] = this._reviewImageUrl;
    data['notification_image_url'] = this._notificationImageUrl;
    data['restaurant_image_url'] = this._restaurantImageUrl;
    data['delivery_man_image_url'] = this._deliveryManImageUrl;
    data['chat_image_url'] = this._chatImageUrl;
    data['kitchen_image_url'] = this._kitchenProfileUrl;
    return data;
  }
}

class DeliveryManagement {
  int? _status;
  int? _minShippingCharge;
  int? _shippingPerKm;

  DeliveryManagement(
      {int? status, int? minShippingCharge, int? shippingPerKm}) {
    if (status != null) {
      this._status = status;
    }
    if (minShippingCharge != null) {
      this._minShippingCharge = minShippingCharge;
    }
    if (shippingPerKm != null) {
      this._shippingPerKm = shippingPerKm;
    }
  }

  int? get status => _status;
  int? get minShippingCharge => _minShippingCharge;
  int? get shippingPerKm => _shippingPerKm;


  DeliveryManagement.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _minShippingCharge = json['min_shipping_charge'];
    _shippingPerKm = json['shipping_per_km'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['min_shipping_charge'] = this._minShippingCharge;
    data['shipping_per_km'] = this._shippingPerKm;
    return data;
  }
}

class Branches {
  int? _id;
  String? _name;
  String? _email;
  String? _longitude;
  String? _latitude;
  String? _address;
  int? _coverage;

  Branches(
      {int? id,
        String? name,
        String? email,
        String? longitude,
        String? latitude,
        String? address,
        int? coverage}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (email != null) {
      this._email = email;
    }
    if (longitude != null) {
      this._longitude = longitude;
    }
    if (latitude != null) {
      this._latitude = latitude;
    }
    if (address != null) {
      this._address = address;
    }
    if (coverage != null) {
      this._coverage = coverage;
    }
  }

  int? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get longitude => _longitude;
  String? get latitude => _latitude;
  String? get address => _address;
  int? get coverage => _coverage;


  Branches.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
    _address = json['address'];
    _coverage = json['coverage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['email'] = this._email;
    data['longitude'] = this._longitude;
    data['latitude'] = this._latitude;
    data['address'] = this._address;
    data['coverage'] = this._coverage;
    return data;
  }
}

class PlayStoreConfig {
  bool? _status;
  String? _link;
  String? _minVersion;

  PlayStoreConfig({bool? status, String? link, String? minVersion}) {
    if (status != null) {
      this._status = status;
    }
    if (link != null) {
      this._link = link;
    }
    if (minVersion != null) {
      this._minVersion = minVersion;
    }
  }

  bool? get status => _status;
  String? get link => _link;
  String? get minVersion => _minVersion;


  PlayStoreConfig.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _link = json['link'];
    _minVersion = json['min_version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['link'] = this._link;
    data['min_version'] = this._minVersion;
    return data;
  }
}

class SocialMediaLink {
  int? _id;
  String? _name;
  String? _link;
  int? _status;


  SocialMediaLink(
      {int? id,
        String? name,
        String? link,
        int? status,
        }) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (link != null) {
      this._link = link;
    }
    if (status != null) {
      this._status = status;
    }

  }

  int? get id => _id;
  String? get name => _name;
  String? get link => _link;
  int? get status => _status;


  SocialMediaLink.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _link = json['link'];
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['link'] = this._link;
    data['status'] = this._status;
    return data;
  }
}
