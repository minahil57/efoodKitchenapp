class OrderDetailsModel {
  Order order = Order(id: 0, tableId: 0, numberOfPeople: 0, tableOrderId: 0, orderNote: '', orderStatus: '');
  List<Details> details = [];

  OrderDetailsModel({required this.order, required this.details});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    order = (json['order'] != null ? new Order.fromJson(json['order']) : null)!;
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details.add(new Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order'] = this.order.toJson();
    data['details'] = this.details.map((v) => v.toJson()).toList();

    return data;
  }
}

class Order {
  int id = 0;
  int tableId = 0;
  int numberOfPeople = 0;
  int tableOrderId = 0;
  String orderNote = '';
  String orderStatus = '';
  Table? table;
  num? couponDiscountAmount;
  num? tax;
  num? deliveryCharge;
  num? extraDiscount;

  Order(
      {required this.id,
        required this.tableId,
        required this.numberOfPeople,
        required this.tableOrderId,
        required this.orderNote,
        required this.orderStatus,
        this.couponDiscountAmount,
        this.tax,
        this.extraDiscount,
        this.deliveryCharge,
      });

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if(json['table_id'] != null){
      tableId = json['table_id'];
    }
    if(json['number_of_people'] != null){
      numberOfPeople = json['number_of_people'];
    }
    if(json['table_order_id'] != null){
      tableOrderId = json['table_order_id'];
    }

    if(json['order_note'] != null){
      orderNote = json['order_note'];
    }

    orderStatus = json['order_status'];
    table = json['table'] != null ? new Table.fromJson(json['table']) : null;
    tax = json['total_tax_amount'];
    couponDiscountAmount = json['coupon_discount_amount'];
    extraDiscount = double.tryParse(json['extra_discount']);
    deliveryCharge = json['delivery_charge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['table_id'] = this.tableId;
    data['number_of_people'] = this.numberOfPeople;
    data['table_order_id'] = this.tableOrderId;
    data['order_note'] = this.orderNote;
    data['order_status'] = this.orderStatus;
    if (this.table != null) {
      data['table'] = this.table!.toJson();
    }
    return data;
  }
}

class Details {
  int? id;
  int? productId;
  int? orderId;
  double? price;
  ProductDetails? productDetails;
  Variations? variation;
  double? discountOnProduct;
  String? discountType;
  int? quantity;
  double? taxAmount;
  String? createdAt;
  String? updatedAt;
  List<dynamic>? addOnIds;
  List<dynamic>? addOnQtys;

  Details(
      {this.id,
        this.productId,
        this.orderId,
        this.price,
        this.productDetails,
        this.variation,
        this.discountOnProduct,
        this.discountType,
        this.quantity,
        this.taxAmount,
        this.createdAt,
        this.updatedAt,
        this.addOnIds,
        this.addOnQtys,
      });

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    orderId = json['order_id'];
    price = json['price'].toDouble();
    productDetails = json['product_details'] != null
        ? new ProductDetails.fromJson(json['product_details'])
        : null;
    if(json['variation'] != null && json['variation'] != 'null') {
      variation = Variations.fromJson(json['variation']) ;
    }

    discountOnProduct = json['discount_on_product'].toDouble();
    discountType = json['discount_type'];
    quantity = json['quantity'];
    taxAmount = json['tax_amount'].toDouble();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    addOnIds = json['add_on_ids'];
    addOnQtys = json['add_on_qtys'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['order_id'] = this.orderId;
    data['price'] = this.price;
    if (this.productDetails != null) {
      data['product_details'] = this.productDetails!.toJson();
    }
    if (this.variation != null) {
      data['variation'] = this.variation;
    }
    data['discount_on_product'] = this.discountOnProduct;
    data['discount_type'] = this.discountType;
    data['quantity'] = this.quantity;
    data['tax_amount'] = this.taxAmount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['add_on_ids'] = this.addOnIds;
    data['add_on_qtys'] = this.addOnQtys;
    return data;
  }
}

class ProductDetails {
  int? id;
  String? name;
  String? description;
  String? image;
  double? price;
  List<Variations>? variations;
  List<AddOns>? addOns;
  double? tax;
  String? availableTimeStarts;
  String? availableTimeEnds;
  int? status;
  String? createdAt;
  String? updatedAt;
  List<String>? attributes;
  List<CategoryIds>? categoryIds;
  List<ChoiceOptions>? choiceOptions;
  double? discount;
  String? discountType;
  String? taxType;
  int? setMenu;
  int? branchId;
  int? popularityCount;
  String? productType;


  ProductDetails(
      {this.id,
        this.name,
        this.description,
        this.image,
        this.price,
        this.variations,
        this.addOns,
        this.tax,
        this.availableTimeStarts,
        this.availableTimeEnds,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.attributes,
        this.categoryIds,
        this.choiceOptions,
        this.discount,
        this.discountType,
        this.taxType,
        this.setMenu,
        this.branchId,
        this.popularityCount,
        this.productType,
       });

  ProductDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    price = json['price'].toDouble();
    if (json['variations'] != null) {
      variations = <Variations>[];
      json['variations'].forEach((v) {
        variations!.add(new Variations.fromJson(v));
      });
    }
    if (json['add_ons'] != null) {
      addOns = <AddOns>[];
      json['add_ons'].forEach((v) {
        addOns!.add(new AddOns.fromJson(v));
      });
    }
    tax = json['tax'].toDouble();
    availableTimeStarts = json['available_time_starts'];
    availableTimeEnds = json['available_time_ends'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    attributes = json['attributes'].cast<String>();
    if (json['category_ids'] != null) {
      categoryIds = <CategoryIds>[];
      json['category_ids'].forEach((v) {
        categoryIds!.add(new CategoryIds.fromJson(v));
      });
    }
    if (json['choice_options'] != null) {
      choiceOptions = <ChoiceOptions>[];
      json['choice_options'].forEach((v) {
        choiceOptions!.add(new ChoiceOptions.fromJson(v));
      });
    }
    discount = json['discount'].toDouble();
    discountType = json['discount_type'];
    taxType = json['tax_type'];
    setMenu = json['set_menu'];
    branchId = json['branch_id'];
    popularityCount = json['popularity_count'];
    productType = json['product_type'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['price'] = this.price;
    if (this.variations != null) {
      data['variations'] = this.variations!.map((v) => v.toJson()).toList();
    }
    if (this.addOns != null) {
      data['add_ons'] = this.addOns!.map((v) => v.toJson()).toList();
    }
    data['tax'] = this.tax;
    data['available_time_starts'] = this.availableTimeStarts;
    data['available_time_ends'] = this.availableTimeEnds;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['attributes'] = this.attributes;
    if (this.categoryIds != null) {
      data['category_ids'] = this.categoryIds!.map((v) => v.toJson()).toList();
    }
    if (this.choiceOptions != null) {
      data['choice_options'] =
          this.choiceOptions!.map((v) => v.toJson()).toList();
    }
    data['discount'] = this.discount;
    data['discount_type'] = this.discountType;
    data['tax_type'] = this.taxType;
    data['set_menu'] = this.setMenu;
    data['branch_id'] = this.branchId;
    data['popularity_count'] = this.popularityCount;
    data['product_type'] = this.productType;

    return data;
  }
}

class Variations {
  String? type;
  double? price;

  Variations({this.type, this.price});

  Variations.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if(json['price'] != null && json['price'] != 'null') {
      price = double.parse('${json['price']}');
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['price'] = this.price;
    return data;
  }
}

class AddOns {
  int? id;
  String? name;
  double? price;
  String? createdAt;
  String? updatedAt;
  List<Null>? translations;

  AddOns(
      {this.id,
        this.name,
        this.price,
        this.createdAt,
        this.updatedAt,
        this.translations});

  AddOns.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if(json['price'] != null && json['price'] != 'null') {
      price = double.parse('${json['price']}');
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;

    return data;
  }
}

class CategoryIds {
  String? id;
  int? position;

  CategoryIds({this.id, this.position});

  CategoryIds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['position'] = this.position;
    return data;
  }
}

class ChoiceOptions {
  String? name;
  String? title;
  List<String>? options;

  ChoiceOptions({this.name, this.title, this.options});

  ChoiceOptions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    title = json['title'];
    options = json['options'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['title'] = this.title;
    data['options'] = this.options;
    return data;
  }
}
class Table {
  int? id;
  int? number;

  Table(
      {this.id,
        this.number,
       });

  Table.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number'] = this.number;
    return data;
  }
}
