import 'Data.dart';

/// message : "User Profile Retrieved Successfully"
/// data : {"id":7,"name":"habiba33","email":"Habiba33@gmail.com","image":null}
/// status : true
/// code : 200

class GetUser {
  GetUser({
      String? message, 
      GetUserData? data,
      bool? status, 
      num? code,}){
    _message = message;
    _data = data;
    _status = status;
    _code = code;
}

  GetUser.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'] != null ? GetUserData.fromJson(json['data']) : null;
    _status = json['status'];
    _code = json['code'];
  }
  String? _message;
  GetUserData? _data;
  bool? _status;
  num? _code;
GetUser copyWith({  String? message,
  GetUserData? data,
  bool? status,
  num? code,
}) => GetUser(  message: message ?? _message,
  data: data ?? _data,
  status: status ?? _status,
  code: code ?? _code,
);
  String? get message => _message;
  GetUserData? get data => _data;
  bool? get status => _status;
  num? get code => _code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['status'] = _status;
    map['code'] = _code;
    return map;
  }

}