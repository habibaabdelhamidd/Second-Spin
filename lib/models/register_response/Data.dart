/// name : "habiba28"
/// email : "habiba28@gmail.com"
/// password : "Habiba@2468"
/// token : "23|unzOlvUTadkh1qhO7guTR74x1OFxRlnVwZp57vJi4eff3198"

class RegisterData {
  RegisterData({
      String? name, 
      String? email, 
      String? password, 
      String? token,}){
    _name = name;
    _email = email;
    _password = password;
    _token = token;
}

  RegisterData.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _password = json['password'];
    _token = json['token'];
  }
  String? _name;
  String? _email;
  String? _password;
  String? _token;
RegisterData copyWith({  String? name,
  String? email,
  String? password,
  String? token,
}) => RegisterData(  name: name ?? _name,
  email: email ?? _email,
  password: password ?? _password,
  token: token ?? _token,
);
  String? get name => _name;
  String? get email => _email;
  String? get password => _password;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['password'] = _password;
    map['token'] = _token;
    return map;
  }

}