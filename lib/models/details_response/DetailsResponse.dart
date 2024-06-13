import 'Data.dart';

/// message : "Successful query"
/// data : {"id":4,"title":"adidas","description":"Adidas Football Shoes Original","image":"http://www.secondspin.xyz/public/storage/SLhaJCMdLWuwVumvsyDcOYCun9rNPNo8.png","price":"560.00","created_at":"2024-05-28T13:42:44.000000Z","story":null,"location":"giza","location_details":"el zamalleek","category":"Shoes&Bags","user":"1"}
/// status : true
/// code : 200

class DetailsResponse {
  DetailsResponse({
      String? message, 
      DetailsData? data,
      bool? status, 
      num? code,}){
    _message = message;
    _data = data;
    _status = status;
    _code = code;
}

  DetailsResponse.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'] != null ? DetailsData.fromJson(json['data']) : null;
    _status = json['status'];
    _code = json['code'];
  }
  String? _message;
  DetailsData? _data;
  bool? _status;
  num? _code;
DetailsResponse copyWith({  String? message,
  DetailsData? data,
  bool? status,
  num? code,
}) => DetailsResponse(  message: message ?? _message,
  data: data ?? _data,
  status: status ?? _status,
  code: code ?? _code,
);
  String? get message => _message;
  DetailsData? get data => _data;
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