import 'Data.dart';

/// message : " Used Categories retrieved successfully"
/// data : [{"id":2,"name":"Clothes"},{"id":3,"name":"Shoes&Bags"},{"id":4,"name":"Perfumes"},{"id":5,"name":"Kitchen Utensils"},{"id":6,"name":"Electronics"},{"id":7,"name":"Sports"},{"id":8,"name":"Accessories"},{"id":9,"name":"Books"},{"id":10,"name":"Decorations"}]
/// status : true
/// code : 200

class AllCategoriesResponse {
  AllCategoriesResponse({
      String? message, 
      List<Category>? data,
      bool? status, 
      num? code,}){
    _message = message;
    _data = data;
    _status = status;
    _code = code;
}

  AllCategoriesResponse.fromJson(dynamic json) {
    _message = json['message'];
    _code = json['code'];
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Category.fromJson(v));
      });
    }
    _status = json['status'];
    _code = json['code'];
  }
  String? _message;
  List<Category>? _data;
  bool? _status;
  num? _code;
AllCategoriesResponse copyWith({  String? message,
  List<Category>? data,
  bool? status,
  num? code,
}) => AllCategoriesResponse(  message: message ?? _message,
  data: data ?? _data,
  status: status ?? _status,
  code: code ?? _code,
);
  String? get message => _message;
  List<Category>? get data => _data;
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