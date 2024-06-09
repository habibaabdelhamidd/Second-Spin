import 'Data.dart';

/// message : "Charities retrieved Successfully"
/// data : [{"id":1,"name":"Resalla"},{"id":2,"name":"Sonaa El Hayah"},{"id":3,"name":"Merssal"},{"id":4,"name":"Al Takwa"},{"id":5,"name":"Masr El Kheir"},{"id":6,"name":"EL Orman"},{"id":7,"name":"Ekram"}]
/// status : true
/// code : 200

class CharitiesResponse {
  CharitiesResponse({
      String? message, 
      List<Data>? data, 
      bool? status, 
      num? code,}){
    _message = message;
    _data = data;
    _status = status;
    _code = code;
}

  CharitiesResponse.fromJson(dynamic json) {
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _status = json['status'];
    _code = json['code'];
  }
  String? _message;
  List<Data>? _data;
  bool? _status;
  num? _code;
CharitiesResponse copyWith({  String? message,
  List<Data>? data,
  bool? status,
  num? code,
}) => CharitiesResponse(  message: message ?? _message,
  data: data ?? _data,
  status: status ?? _status,
  code: code ?? _code,
);
  String? get message => _message;
  List<Data>? get data => _data;
  bool? get status => _status;
  num? get code => _code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    map['code'] = _code;
    return map;
  }

}