/// token : "17|tumBxXRbjLcnUbiJFPLgCZ8iHaFk2xeMjUTIHPUVae5ed142"
/// name : "habiba22"
/// email : "habiba22@gmail.com"

class LoginData {
  LoginData({
      String? token, 
      String? name, 
      String? email,}){
    _token = token;
    _name = name;
    _email = email;
}

  LoginData.fromJson(dynamic json) {
    _token = json['token'];
    _name = json['name'];
    _email = json['email'];
  }
  String? _token;
  String? _name;
  String? _email;
LoginData copyWith({  String? token,
  String? name,
  String? email,
}) => LoginData(  token: token ?? _token,
  name: name ?? _name,
  email: email ?? _email,
);
  String? get token => _token;
  String? get name => _name;
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    map['name'] = _name;
    map['email'] = _email;
    return map;
  }

}