import 'Data.dart';

/// message : "Updated Successfuly"
/// data : {"id":6,"name":"habiba28","email":"chee@gmail.com","password":"$2y$12$S10NgwwcbaMZ7/hOdR8IWezK9E2NaIN50/KKvWSB2J22ZgupSR4MC","image":null}
/// status : true
/// code : 200

class EditProfile {
  EditProfile({
      String? message, 
      EditData? data,
      bool? status, 
      num? code,}){
    _message = message;
    _data = data;
    _status = status;
    _code = code;
}

  EditProfile.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'] != null ? EditData.fromJson(json['data']) : null;
    _status = json['status'];
    _code = json['code'];
  }
  String? _message;
  EditData? _data;
  bool? _status;
  num? _code;
EditProfile copyWith({  String? message,
  EditData? data,
  bool? status,
  num? code,
}) => EditProfile(  message: message ?? _message,
  data: data ?? _data,
  status: status ?? _status,
  code: code ?? _code,
);
  String? get message => _message;
  EditData? get data => _data;
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