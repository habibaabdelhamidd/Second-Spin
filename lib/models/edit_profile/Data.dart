/// id : 6
/// name : "habiba28"
/// email : "chee@gmail.com"
/// password : "$2y$12$S10NgwwcbaMZ7/hOdR8IWezK9E2NaIN50/KKvWSB2J22ZgupSR4MC"
/// image : null

class EditData {
  EditData({
      num? id, 
      String? name, 
      String? email, 
      String? password, 
      dynamic image,}){
    _id = id;
    _name = name;
    _email = email;
    _password = password;
    _image = image;
}

  EditData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _password = json['password'];
    _image = json['image'];
  }
  num? _id;
  String? _name;
  String? _email;
  String? _password;
  dynamic _image;
EditData copyWith({  num? id,
  String? name,
  String? email,
  String? password,
  dynamic image,
}) => EditData(  id: id ?? _id,
  name: name ?? _name,
  email: email ?? _email,
  password: password ?? _password,
  image: image ?? _image,
);
  num? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get password => _password;
  dynamic get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['password'] = _password;
    map['image'] = _image;
    return map;
  }

}