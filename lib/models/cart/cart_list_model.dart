class CartListModel {
  String? message;
  List<CartList>? data;
  bool? status;
  int? code;

  CartListModel({this.message, this.data, this.status, this.code});

  CartListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <CartList>[];
      json['data'].forEach((v) {
        data!.add(new CartList.fromJson(v));
      });
    }
    status = json['status'];
    code = json['code'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['code'] = this.code;
    return data;
  }
}
class CartList{
  int? id;
  String? title;
  String? price;
  String? location;
  String? image;
  int? productId;
  bool ? incart;

  CartList(
      {this.id,
        this.title,
        this.price,
        this.location,
        this.image,
        this.productId,
        this.incart=true,
      }
      );

  CartList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    location = json['location'];
    image = json['image'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['location'] = this.location;
    data['image'] = this.image;
    data['product_id'] = this.productId;
    return data;
  }
}