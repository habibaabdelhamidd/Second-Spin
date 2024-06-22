/// message : "Charities retrieved Successfully"
/// data : [{"id":3,"name":"Merssal"},{"id":4,"name":"Al Takwa"},{"id":5,"name":"Masr El Kheir"},{"id":6,"name":"EL Orman"},{"id":7,"name":"Ekram"},{"id":8,"name":"Resala"},{"id":9,"name":"Sonaa El Hayah"}]
/// status : true
/// code : 200

class CharityData {
  CharityData({
      String? message, 
      List<CharityRes>? data,
      bool? status, 
      num? code,}){
    _message = message;
    _data = data;
    _status = status;
    _code = code;
}

  CharityData.fromJson(dynamic json) {
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(CharityRes.fromJson(v));
      });
    }
    _status = json['status'];
    _code = json['code'];
  }
  String? _message;
  List<CharityRes>? _data;
  bool? _status;
  num? _code;
CharityData copyWith({  String? message,
  List<CharityRes>? data,
  bool? status,
  num? code,
}) => CharityData(  message: message ?? _message,
  data: data ?? _data,
  status: status ?? _status,
  code: code ?? _code,
);
  String? get message => _message;
  List<CharityRes>? get data => _data;
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

/// id : 3
/// name : "Merssal"

class CharityRes {
  CharityRes({
      num? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  CharityRes.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;
CharityRes copyWith({  num? id,
  String? name,
}) => CharityRes(  id: id ?? _id,
  name: name ?? _name,
);
  num? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}