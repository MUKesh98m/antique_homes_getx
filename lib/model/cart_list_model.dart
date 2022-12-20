import 'dart:convert';

CartListModel cartListModelFromJson(String str) =>
    CartListModel.fromJson(json.decode(str));

String cartListModelToJson(CartListModel data) => json.encode(data.toJson());

class CartListModel {
  CartListModel({
    this.flag,
    this.data,
    this.message,
  });

  bool? flag;
  Data? data;
  String? message;

  factory CartListModel.fromJson(Map<String, dynamic> json) => CartListModel(
    flag: json["flag"] == null ? null : json["flag"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "flag": flag == null ? null : flag,
    "data": data == null ? null : data?.toJson(),
    "message": message == null ? null : message,
  };
}

class Data {
  Data({
    this.cart,
    this.totalPrice,
  });

  List<Cart>? cart;
  String? totalPrice;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    cart: json["cart"] == null
        ? []
        : List<Cart>.from(json["cart"].map((x) => Cart.fromJson(x))),
    totalPrice: json["total_price"] == null ? null : json["total_price"],
  );

  Map<String, dynamic> toJson() => {
    "cart": cart == null
        ? []
        : List<dynamic>.from(cart!.map((x) => x.toJson())),
    "total_price": totalPrice == null ? null : totalPrice,
  };
}

class Cart {
  Cart({
    this.cartId,
    this.productId,
    this.id,
    this.name,
    this.mrp,
    this.description,
    this.image,
    this.productName,
    this.productPrice,
    this.img,
  });

  int? cartId;
  int? productId;
  int? id;
  String? name;
  int? mrp;
  String? description;
  String? image;
  String? productName;
  int? productPrice;
  String? img;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    cartId: json["cart_id"] == null ? null : json["cart_id"],
    productId: json["product_id"] == null ? null : json["product_id"],
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    mrp: json["mrp"] == null ? null : json["mrp"],
    description: json["description"] == null ? null : json["description"],
    image: json["image"] == null ? null : json["image"],
    productName: json["product_name"] == null ? null : json["product_name"],
    productPrice:
    json["product_price"] == null ? null : json["product_price"],
    img: json["img"] == null ? null : json["img"],
  );

  Map<String, dynamic> toJson() => {
    "cart_id": cartId == null ? null : cartId,
    "product_id": productId == null ? null : productId,
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "mrp": mrp == null ? null : mrp,
    "description": description == null ? null : description,
    "image": image == null ? null : image,
    "product_name": productName == null ? null : productName,
    "product_price": productPrice == null ? null : productPrice,
    "img": img == null ? null : img,
  };
}
