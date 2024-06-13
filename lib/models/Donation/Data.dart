/// id : 3
/// description : "white ashdkjshjkjf"
/// title : "tshirt dajkfjkashfjashsd"
/// image : "m7MS4ykvNVhoAnQ092sOH5tYUlN28URG.jpg"
/// location : "cairo"
/// location_details : "helwan sdfafafeefe"

class Data {
  Data({
      num? id, 
      String? description, 
      String? title, 
      String? image, 
      String? location, 
      String? locationDetails,}){
    _id = id;
    _description = description;
    _title = title;
    _image = image;
    _location = location;
    _locationDetails = locationDetails;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _description = json['description'];
    _title = json['title'];
    _image = json['image'];
    _location = json['location'];
    _locationDetails = json['location_details'];
  }
  num? _id;
  String? _description;
  String? _title;
  String? _image;
  String? _location;
  String? _locationDetails;
Data copyWith({  num? id,
  String? description,
  String? title,
  String? image,
  String? location,
  String? locationDetails,
}) => Data(  id: id ?? _id,
  description: description ?? _description,
  title: title ?? _title,
  image: image ?? _image,
  location: location ?? _location,
  locationDetails: locationDetails ?? _locationDetails,
);
  num? get id => _id;
  String? get description => _description;
  String? get title => _title;
  String? get image => _image;
  String? get location => _location;
  String? get locationDetails => _locationDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['description'] = _description;
    map['title'] = _title;
    map['image'] = _image;
    map['location'] = _location;
    map['location_details'] = _locationDetails;
    return map;
  }

}