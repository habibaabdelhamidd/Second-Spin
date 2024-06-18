/// message : "  Category retrieved successfully"
/// data : [{"id":1,"name":"Recycle"},{"id":2,"name":"Clothes"},{"id":3,"name":"Shoes&Bags"},{"id":4,"name":"Perfumes"},{"id":5,"name":"Kitchen Utensils"},{"id":6,"name":"Electronics"},{"id":7,"name":"Sports"},{"id":8,"name":"Accessories"},{"id":9,"name":"Books"},{"id":10,"name":"Decorations"}]
/// status : true
/// code : 200

class CategoryList {
  CategoryList({
      String? message, 
      List<ListData>? data,
      bool? status, 
      num? code,}){
    _message = message;
    _data = data;
    _status = status;
    _code = code;
}

  CategoryList.fromJson(dynamic json) {
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ListData.fromJson(v));
      });
    }
    _status = json['status'];
    _code = json['code'];
  }
  String? _message;
  List<ListData>? _data;
  bool? _status;
  num? _code;
CategoryList copyWith({  String? message,
  List<ListData>? data,
  bool? status,
  num? code,
}) => CategoryList(  message: message ?? _message,
  data: data ?? _data,
  status: status ?? _status,
  code: code ?? _code,
);
  String? get message => _message;
  List<ListData>? get data => _data;
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

/// id : 1
/// name : "Recycle"

class ListData {
  ListData({
      num? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  ListData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;
ListData copyWith({  num? id,
  String? name,
}) => ListData(  id: id ?? _id,
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