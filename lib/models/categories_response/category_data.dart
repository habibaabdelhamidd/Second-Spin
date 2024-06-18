/// id : 4
/// title : "adidas"
/// image : "http://www.secondspin.xyz/public/storage/SLhaJCMdLWuwVumvsyDcOYCun9rNPNo8.png"
/// price : "560.00"
/// location : "giza"

class CategoryData {
  CategoryData({
      num? id, 
      String? title, 
      String? image, 
      String? price, 
      String? location,
  }){
    _id = id;
    _title = title;
    _image = image;
    _price = price;
    _location = location;
}

  CategoryData.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _image = json['image'];
    _price = json['price'];
    _location = json['location'];
  }
  num? _id;
  String? _title;
  String? _image;
  String? _price;
  String? _location;
CategoryData copyWith({  num? id,
  String? title,
  String? image,
  String? price,
  String? location,
}) => CategoryData(  id: id ?? _id,
  title: title ?? _title,
  image: image ?? _image,
  price: price ?? _price,
  location: location ?? _location,
);
  num? get id => _id;
  String? get title => _title;
  String? get image => _image;
  String? get price => _price;
  String? get location => _location;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['image'] = _image;
    map['price'] = _price;
    map['location'] = _location;
    return map;
  }

}