import 'category_data.dart';

/// message : "Products retrieved successfully"
/// data : [{"id":30,"title":"party decorations","image":"WE6G5ygPLFzwT03vhkXUZAoR6WbJQxHE.jpg","price":"125.44","location":"cairo"},{"id":33,"title":"wedding","image":"WGFlOmle6g7dQUE9eOb6jiFTfWnfvM83.jpg","price":"94.08","location":"cairo"},{"id":34,"title":"christmas","image":"NjuJnGrpzguhYTKZW4AkqVvm9iy8XGDf.jpg","price":"448.00","location":"cairo"}]
/// status : true
/// code : 200

class CategoryResponse {
  CategoryResponse({
      String? message, 
      List<CategoryData>? data,
      bool? status, 
      num? code,}){
    _message = message;
    _data = data;
    _status = status;
    _code = code;
}

  CategoryResponse.fromJson(dynamic json) {
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(CategoryData.fromJson(v));
      });
    }
    _status = json['status'];
    _code = json['code'];
  }
  String? _message;
  List<CategoryData>? _data;
  bool? _status;
  num? _code;
CategoryResponse copyWith({  String? message,
  List<CategoryData>? data,
  bool? status,
  num? code,
}) => CategoryResponse(  message: message ?? _message,
  data: data ?? _data,
  status: status ?? _status,
  code: code ?? _code,
);
  String? get message => _message;
  List<CategoryData>? get data => _data;
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