/// message : "Added Successfuly"
/// data : true
/// status : true
/// code : 201

class AddPic {
  AddPic({
      String? message, 
      bool? data, 
      bool? status, 
      num? code,}){
    _message = message;
    _data = data;
    _status = status;
    _code = code;
}

  AddPic.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'];
    _status = json['status'];
    _code = json['code'];
  }
  String? _message;
  bool? _data;
  bool? _status;
  num? _code;
AddPic copyWith({  String? message,
  bool? data,
  bool? status,
  num? code,
}) => AddPic(  message: message ?? _message,
  data: data ?? _data,
  status: status ?? _status,
  code: code ?? _code,
);
  String? get message => _message;
  bool? get data => _data;
  bool? get status => _status;
  num? get code => _code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['data'] = _data;
    map['status'] = _status;
    map['code'] = _code;
    return map;
  }

}