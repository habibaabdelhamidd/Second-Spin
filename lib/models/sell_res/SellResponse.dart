import 'Data.dart';

/// message : "Added Successfuly"
/// data : {"id":124,"title":"ladder","description":"bikia to sell","image":"http://secondspin.xyz/storage/app/public/2CjmgeQTfzS4nkl5hEy6NYuGEqrzNeev.jpg","price":103.03999999999999,"created_at":"2024-06-16T16:17:41.000000Z","story":null,"location":"giza","location_details":"el sheikh zayed","category":"Recycle","user":6}
/// status : true
/// code : 201

class SellResponse {
  SellResponse({
      String? message, 
      SellData? data,
      bool? status, 
      num? code,}){
    _message = message;
    _data = data;
    _status = status;
    _code = code;
}

  SellResponse.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'] != null ? SellData.fromJson(json['data']) : null;
    _status = json['status'];
    _code = json['code'];
  }
  String? _message;
  SellData? _data;
  bool? _status;
  num? _code;
SellResponse copyWith({  String? message,
  SellData? data,
  bool? status,
  num? code,
}) => SellResponse(  message: message ?? _message,
  data: data ?? _data,
  status: status ?? _status,
  code: code ?? _code,
);
  String? get message => _message;
  SellData? get data => _data;
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