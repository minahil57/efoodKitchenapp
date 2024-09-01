class OrderModel {
  List<Orders>? _data;
  String? _firstPageUrl;
  int? _from;
  int? _lastPage;
  int? _perPage;
  int? _total;

  OrderModel(
      {
        List<Orders>? data,
        String? firstPageUrl,
        int? from,
        int? perPage,
        int? to,
        int? total}) {

    if (data != null) {
      this._data = data;
    }
    if (firstPageUrl != null) {
      this._firstPageUrl = firstPageUrl;
    }
    if (from != null) {
      this._from = from;
    }
    if (lastPage != null) {
      this._lastPage = lastPage;
    }

    if (perPage != null) {
      this._perPage = perPage;
    }

    if (total != null) {
      this._total = total;
    }
  }


  List<Orders>? get data => _data;
  int? get from => _from;
  int? get lastPage => _lastPage;
  int? get perPage => _perPage;
  int? get total => _total;


  OrderModel.fromJson(Map<String, dynamic> json) {

    if (json['data'] != null) {
      _data = <Orders>[];
      json['data'].forEach((v) {
        _data!.add(new Orders.fromJson(v));
      });
    }
    _firstPageUrl = json['first_page_url'];
    _from = json['from'];
    _lastPage = json['last_page'];
    _perPage = json['per_page'];
    _total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this._firstPageUrl;
    data['from'] = this._from;
    data['last_page'] = this._lastPage;
    data['per_page'] = this._perPage;
    data['total'] = this._total;
    return data;
  }
}

class Orders {
  int? _id;
  int? _userId;
  double? _orderAmount;
  num? _couponDiscountAmount;
  String? _paymentStatus;
  String? _orderStatus;
  double? _totalTaxAmount;
  String? _paymentMethod;
  int? _deliveryAddressId;
  String? _createdAt;
  String? _updatedAt;
  int? _checked;
  int? _deliveryManId;
  double? _deliveryCharge;
  String _orderNote = '';
  String? _couponCode;
  String? _orderType;
  int? _branchId;
  String? _deliveryDate;
  String? _deliveryTime;
  String? _extraDiscount;
  DeliveryAddress? _deliveryAddress;
  int? _preparationTime;
  int? _tableNumber;
  int? _numberOfPeople;
  Table? _table;

  Orders(
      {int? id,
        int? userId,
        double? orderAmount,
        int? couponDiscountAmount,
        String? paymentStatus,
        String? orderStatus,
        double? totalTaxAmount,
        String? paymentMethod,
        int? deliveryAddressId,
        String? createdAt,
        String? updatedAt,
        int? checked,
        int? deliveryManId,
        double? deliveryCharge,
        String orderNote ='',
        String? couponCode,
        String? orderType,
        int? branchId,
        String? deliveryDate,
        String? deliveryTime,
        String? extraDiscount,
        DeliveryAddress? deliveryAddress,
        int? preparationTime,
        int? tableNumber,
        int? numberOfPeople,
        Table? table
      }) {
    if (id != null) {
      this._id = id;
    }
    if (userId != null) {
      this._userId = userId;
    }
    if (orderAmount != null) {
      this._orderAmount = orderAmount;
    }
    if (couponDiscountAmount != null) {
      this._couponDiscountAmount = couponDiscountAmount;
    }
    if (paymentStatus != null) {
      this._paymentStatus = paymentStatus;
    }
    if (orderStatus != null) {
      this._orderStatus = orderStatus;
    }
    if (totalTaxAmount != null) {
      this._totalTaxAmount = totalTaxAmount;
    }
    if (paymentMethod != null) {
      this._paymentMethod = paymentMethod;
    }

    if (deliveryAddressId != null) {
      this._deliveryAddressId = deliveryAddressId;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (checked != null) {
      this._checked = checked;
    }
    if (deliveryManId != null) {
      this._deliveryManId = deliveryManId;
    }
    if (deliveryCharge != null) {
      this._deliveryCharge = deliveryCharge;
    }
    this._orderNote = orderNote;
    if (couponCode != null) {
      this._couponCode = couponCode;
    }
    if (orderType != null) {
      this._orderType = orderType;
    }
    if (branchId != null) {
      this._branchId = branchId;
    }

    if (deliveryDate != null) {
      this._deliveryDate = deliveryDate;
    }
    if (deliveryTime != null) {
      this._deliveryTime = deliveryTime;
    }
    if (extraDiscount != null) {
      this._extraDiscount = extraDiscount;
    }
    if (deliveryAddress != null) {
      this._deliveryAddress = deliveryAddress;
    }
    if (preparationTime != null) {
      this._preparationTime = preparationTime;
    }
    if (tableNumber != null) {
      this._tableNumber = tableNumber;
    }
    if (numberOfPeople != null) {
      this._numberOfPeople = numberOfPeople;
    }
    if (table != null) {
      this._table = table;
    }
  }

  int? get id => _id;
  int? get userId => _userId;
  double? get orderAmount => _orderAmount;

  String? get paymentStatus => _paymentStatus;
  String? get orderStatus => _orderStatus;
  double? get totalTaxAmount => _totalTaxAmount;
  String? get paymentMethod => _paymentMethod;
  int? get deliveryAddressId => _deliveryAddressId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get checked => _checked;
  int? get deliveryManId => _deliveryManId;
  double? get deliveryCharge => _deliveryCharge;
  String get orderNote => _orderNote;
  String? get couponCode => _couponCode;
  String? get orderType => _orderType;
  int? get branchId => _branchId;
  String? get deliveryDate => _deliveryDate;
  String? get deliveryTime => _deliveryTime;
  String? get extraDiscount => _extraDiscount;
  DeliveryAddress? get deliveryAddress => _deliveryAddress;
  int? get preparationTime => _preparationTime;
  int? get tableNumber => _tableNumber;
  int? get numberOfPeople => _numberOfPeople;
  Table? get table => _table;

  Orders.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _userId = json['user_id'];
    _orderAmount = json['order_amount'].toDouble();
    _couponDiscountAmount = json['coupon_discount_amount'];
    _paymentStatus = json['payment_status'];
    _orderStatus = json['order_status'];
    _totalTaxAmount = json['total_tax_amount'].toDouble();
    _paymentMethod = json['payment_method'];
    _deliveryAddressId = json['delivery_address_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _checked = json['checked'];
    _deliveryManId = json['delivery_man_id'];
    _deliveryCharge = json['delivery_charge'].toDouble();
    if(json['order_note'] != null){
      _orderNote = json['order_note'];
    }else{
      _orderNote = '';
    }

    _couponCode = json['coupon_code'];
    _orderType = json['order_type'];
    _branchId = json['branch_id'];
    _deliveryDate = json['delivery_date'];
    _deliveryTime = json['delivery_time'];
    _extraDiscount = json['extra_discount'];
    _deliveryAddress = json['delivery_address'] != null
        ? new DeliveryAddress.fromJson(json['delivery_address'])
        : null;
    _preparationTime = json['preparation_time'];
    _tableNumber = json['table_id'];
    _numberOfPeople = json['number_of_people'];
    _table = json['table'] != null ? new Table.fromJson(json['table']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['user_id'] = this._userId;
    data['order_amount'] = this._orderAmount;
    data['coupon_discount_amount'] = this._couponDiscountAmount;
    data['payment_status'] = this._paymentStatus;
    data['order_status'] = this._orderStatus;
    data['total_tax_amount'] = this._totalTaxAmount;
    data['payment_method'] = this._paymentMethod;
    data['delivery_address_id'] = this._deliveryAddressId;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['checked'] = this._checked;
    data['delivery_man_id'] = this._deliveryManId;
    data['delivery_charge'] = this._deliveryCharge;
    data['order_note'] = this._orderNote;
    data['coupon_code'] = this._couponCode;
    data['order_type'] = this._orderType;
    data['branch_id'] = this._branchId;
    data['delivery_date'] = this._deliveryDate;
    data['delivery_time'] = this._deliveryTime;
    data['extra_discount'] = this._extraDiscount;
    if (this._deliveryAddress != null) {
      data['delivery_address'] = this._deliveryAddress!.toJson();
    }
    data['preparation_time'] = this._preparationTime;
    data['table_id'] = this._tableNumber;
    data['number_of_people'] = this._numberOfPeople;
    if (this._table != null) {
      data['table'] = this._table!.toJson();
    }
    return data;
  }
}

class DeliveryAddress {
  int? _id;
  String? _addressType;
  String? _contactPersonNumber;
  String? _address;
  String? _latitude;
  String? _longitude;
  String? _createdAt;
  String? _updatedAt;
  int? _userId;
  String? _contactPersonName;

  DeliveryAddress(
      {int? id,
        String? addressType,
        String? contactPersonNumber,
        String? address,
        String? latitude,
        String? longitude,
        String? createdAt,
        String? updatedAt,
        int? userId,
        String? contactPersonName}) {
    if (id != null) {
      this._id = id;
    }
    if (addressType != null) {
      this._addressType = addressType;
    }
    if (contactPersonNumber != null) {
      this._contactPersonNumber = contactPersonNumber;
    }
    if (address != null) {
      this._address = address;
    }
    if (latitude != null) {
      this._latitude = latitude;
    }
    if (longitude != null) {
      this._longitude = longitude;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (userId != null) {
      this._userId = userId;
    }
    if (contactPersonName != null) {
      this._contactPersonName = contactPersonName;
    }
  }

  int? get id => _id;
  String? get addressType => _addressType;
  String? get contactPersonNumber => _contactPersonNumber;
  String? get address => _address;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get userId => _userId;
  String? get contactPersonName => _contactPersonName;


  DeliveryAddress.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _addressType = json['address_type'];
    _contactPersonNumber = json['contact_person_number'];
    _address = json['address'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _userId = json['user_id'];
    _contactPersonName = json['contact_person_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['address_type'] = this._addressType;
    data['contact_person_number'] = this._contactPersonNumber;
    data['address'] = this._address;
    data['latitude'] = this._latitude;
    data['longitude'] = this._longitude;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['user_id'] = this._userId;
    data['contact_person_name'] = this._contactPersonName;
    return data;
  }
}


class Table {
  int? _number;
  Table(
      {int? number}) {

    if (number != null) {
      this._number = number;
    }

  }

  int? get number => _number;
  Table.fromJson(Map<String, dynamic> json) {
    _number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this._number;
    return data;
  }
}