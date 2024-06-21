/// id : 7
/// name : "habiba33"
/// email : "Habiba33@gmail.com"
/// image : null

class GetUserData {
  GetUserData({
      num? id, 
      String? name, 
      String? email, 
      dynamic image,}){
    _id = id;
    _name = name;
    _email = email;
    _image = image;
}

  GetUserData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _image = json['image'];
  }
  num? _id;
  String? _name;
  String? _email;
  dynamic _image;
GetUserData copyWith({  num? id,
  String? name,
  String? email,
  dynamic image,
}) => GetUserData(  id: id ?? _id,
  name: name ?? _name,
  email: email ?? _email,
  image: image ?? _image,
);
  num? get id => _id;
  String? get name => _name;
  String? get email => _email;
  dynamic get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['image'] = _image;
    return map;
  }

}