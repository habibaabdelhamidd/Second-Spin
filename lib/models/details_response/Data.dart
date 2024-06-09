/// id : 4
/// title : "adidas"
/// image : "http://www.secondspin.xyz/public/storage/SLhaJCMdLWuwVumvsyDcOYCun9rNPNo8.png"
/// price : "560.00"
/// created_at : "2024-05-28T13:42:44.000000Z"
/// story : null
/// location : "giza"
/// location_details : "el zamalleek"
/// category : "Shoes&Bags"
/// user : "1"

class DetailsData {
  DetailsData({
      num? id, 
      String? title, 
      String? image, 
      String? price, 
      String? createdAt, 
      dynamic story, 
      String? location, 
      String? locationDetails, 
      String? category, 
      String? user,}){
    _id = id;
    _title = title;
    _image = image;
    _price = price;
    _createdAt = createdAt;
    _story = story;
    _location = location;
    _locationDetails = locationDetails;
    _category = category;
    _user = user;
}

  DetailsData.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _image = json['image'];
    _price = json['price'];
    _createdAt = json['created_at'];
    _story = json['story'];
    _location = json['location'];
    _locationDetails = json['location_details'];
    _category = json['category'];
    _user = json['user'];
  }
  num? _id;
  String? _title;
  String? _image;
  String? _price;
  String? _createdAt;
  dynamic _story;
  String? _location;
  String? _locationDetails;
  String? _category;
  String? _user;
DetailsData copyWith({  num? id,
  String? title,
  String? image,
  String? price,
  String? createdAt,
  dynamic story,
  String? location,
  String? locationDetails,
  String? category,
  String? user,
}) => DetailsData(  id: id ?? _id,
  title: title ?? _title,
  image: image ?? _image,
  price: price ?? _price,
  createdAt: createdAt ?? _createdAt,
  story: story ?? _story,
  location: location ?? _location,
  locationDetails: locationDetails ?? _locationDetails,
  category: category ?? _category,
  user: user ?? _user,
);
  num? get id => _id;
  String? get title => _title;
  String? get image => _image;
  String? get price => _price;
  String? get createdAt => _createdAt;
  dynamic get story => _story;
  String? get location => _location;
  String? get locationDetails => _locationDetails;
  String? get category => _category;
  String? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['image'] = _image;
    map['price'] = _price;
    map['created_at'] = _createdAt;
    map['story'] = _story;
    map['location'] = _location;
    map['location_details'] = _locationDetails;
    map['category'] = _category;
    map['user'] = _user;
    return map;
  }

}