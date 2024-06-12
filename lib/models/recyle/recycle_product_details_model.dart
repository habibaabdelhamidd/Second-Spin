class RecycleProductDetailsModel {
  String? message;
  ProdcuctData? data;
  bool? status;
  int? code;
  RecycleProductDetailsModel({this.message, this.data, this.status, this.code});
  RecycleProductDetailsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new ProdcuctData.fromJson(json['data']) : null;
    status = json['status'];
    code = json['code'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    data['code'] = this.code;
    return data;
  }
}

class ProdcuctData {
  int ? id;
  String? title;
  String? image;
  String? price;
  String? description ;
  String? createdAt;
  Null? story;
  String? location;
  String? locationDetails;
  String? category;
  String? user;

  ProdcuctData(
      {this.id,
        this.title,
        this.image,
        this.price,
        this.createdAt,
        this.story,
        this.location,
        this.locationDetails,
        this.category,
        this.description,
        this.user});

  ProdcuctData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    price = json['price'];
    createdAt = json['created_at'];
    story = json['story'];
    location = json['location'];
    locationDetails = json['location_details'];
    category = json['category'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['story'] = this.story;
    data['location'] = this.location;
    data['location_details'] = this.locationDetails;
    data['category'] = this.category;
    data['user'] = this.user;
    return data;
  }
}