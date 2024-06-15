import 'Data.dart';

/// message : "User Created Successfully"
/// data : {"name":"habiba28","email":"habiba28@gmail.com","password":"Habiba@2468","token":"23|unzOlvUTadkh1qhO7guTR74x1OFxRlnVwZp57vJi4eff3198"}
/// status : true
/// code : 200

class RegisterResponse {
  RegisterResponse({
      String? message, 
      RegisterData? data,
      bool? status, 
      num? code,}){
    _message = message;
    _data = data;
    _status = status;
    _code = code;
}

  RegisterResponse.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'] != null ? RegisterData.fromJson(json['data']) : null;
    _status = json['status'];
    _code = json['code'];
  }
  String? _message;
  RegisterData? _data;
  bool? _status;
  num? _code;
RegisterResponse copyWith({  String? message,
  RegisterData? data,
  bool? status,
  num? code,
}) => RegisterResponse(  message: message ?? _message,
  data: data ?? _data,
  status: status ?? _status,
  code: code ?? _code,
);
  String? get message => _message;
  RegisterData? get data => _data;
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