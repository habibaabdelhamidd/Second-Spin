import 'Data.dart';

/// message : "User Logged In Successfully"
/// data : {"token":"17|tumBxXRbjLcnUbiJFPLgCZ8iHaFk2xeMjUTIHPUVae5ed142","name":"habiba22","email":"habiba22@gmail.com"}
/// status : true
/// code : 200

class LoginResponse {
  LoginResponse({
      String? message, 
      LoginData? data,
      bool? status, 
      num? code,}){
    _message = message;
    _data = data;
    _status = status;
    _code = code;
}

  LoginResponse.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
    _status = json['status'];
    _code = json['code'];
  }
  String? _message;
  LoginData? _data;
  bool? _status;
  num? _code;
LoginResponse copyWith({  String? message,
  LoginData? data,
  bool? status,
  num? code,
}) => LoginResponse(  message: message ?? _message,
  data: data ?? _data,
  status: status ?? _status,
  code: code ?? _code,
);
  String? get message => _message;
  LoginData? get data => _data;
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