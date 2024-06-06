class HomeModel {
  String? message;
  bool? status;
  int? code;
  List<Data>? allDate;
  HomeModel({this.message, this.status, this.code, this.allDate});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      message: json["message"],
      status: json["status"],
      code: json["code"],
      allDate: List<Data>.from(
          json["data"].map((element) => Data.fromjson(element))),
    );
  }
}
class Data {
  String? id;
  String? title;
  String? image;
  String? price;
  String? location;
  Data({this.id, this.title, this.image, this.price, this.location});
  factory Data.fromjson(Map<String, dynamic> json) {
    return Data(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      price: json["price"],
      location: json["location"],
    );
  }
}
