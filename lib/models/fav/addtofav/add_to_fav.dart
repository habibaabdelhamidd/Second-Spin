class AddToFavModel {
  String? message;
  List<FavProductList>? data;
  bool? status;
  int? code;
  AddToFavModel({this.message, this.data, this.status, this.code});
  AddToFavModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <FavProductList>[];
      json['data'].forEach((v) {
        data!.add(new FavProductList.fromJson(v));
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
class FavProductList {
  String? title;
  String? price;
  String? location;
  String? image;
  int?  id ;
  int? product_id;
  bool ? isfav ;

  FavProductList({this.title, this.price,this.location, this.image , this.id , this.product_id , this.isfav=true});

  FavProductList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
    location = json['location'];
    image = json['image'];
    id = json['id'];
    product_id = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['price'] = this.price;
    data['location'] = this.location;
    data['image'] = this.image;
    data['id']=this.id;
    data['product_id']=this.product_id;
    return data;
  }
}

