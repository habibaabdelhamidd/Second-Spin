import 'Data.dart';

/// message : "Added Successfuly"
/// data : {"id":3,"description":"white ashdkjshjkjf","title":"tshirt dajkfjkashfjashsd","image":"m7MS4ykvNVhoAnQ092sOH5tYUlN28URG.jpg","location":"cairo","location_details":"helwan sdfafafeefe"}
/// status : true
/// code : 201

class DonationFormRes {
  DonationFormRes({
      String? message, 
      Data? data, 
      bool? status, 
      num? code,}){
    _message = message;
    _data = data;
    _status = status;
    _code = code;
}

  DonationFormRes.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _status = json['status'];
    _code = json['code'];
  }
  String? _message;
  Data? _data;
  bool? _status;
  num? _code;
DonationFormRes copyWith({  String? message,
  Data? data,
  bool? status,
  num? code,
}) => DonationFormRes(  message: message ?? _message,
  data: data ?? _data,
  status: status ?? _status,
  code: code ?? _code,
);
  String? get message => _message;
  Data? get data => _data;
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