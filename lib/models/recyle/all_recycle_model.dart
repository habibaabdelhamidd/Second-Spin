class AllRecycleModel{
  String? message ;
  bool? status;
  int? code;
  List<AllRecycle>? all_rec;
  AllRecycleModel({this.message, this.status, this.code, this.all_rec});
  factory AllRecycleModel.fromJson(Map<String, dynamic> json) {
    return AllRecycleModel(
      message: json["message"],
      status: json["status"],
      code: json["code"],
      all_rec: List<AllRecycle>.from(
          json["data"].map((element) => AllRecycle.fromjson(element))),
    );
  }
}
class AllRecycle {
  int? id;
  String? title;
  String? image;
  String? price;
  String? location;
  AllRecycle({this.id, this.title, this.image, this.price, this.location});
  factory AllRecycle.fromjson(Map<String, dynamic> json) {
    return AllRecycle(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      price: json["price"],
      location: json["location"],
    );
  }
}
