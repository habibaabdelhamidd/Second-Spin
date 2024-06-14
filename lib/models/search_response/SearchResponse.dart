import 'Data.dart';

/// message : "Search Done Successfully"
/// data : [{"id":86,"title":"style vase","image":"http://www.secondspin.xyz/public/storage/fgH4UxN1cMfTX11kPS3CHnpz8FxafjKJ.jpg","price":"336.00","location":"giza"}]
/// status : true
/// code : 200

class SearchResponse {
  SearchResponse({
      String? message, 
      List<SearchData>? data,
      bool? status, 
      num? code,}){
    _message = message;
    _data = data;
    _status = status;
    _code = code;
}

  SearchResponse.fromJson(dynamic json) {
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(SearchData.fromJson(v));
      });
    }
    _status = json['status'];
    _code = json['code'];
  }
  String? _message;
  List<SearchData>? _data;
  bool? _status;
  num? _code;
SearchResponse copyWith({  String? message,
  List<SearchData>? data,
  bool? status,
  num? code,
}) => SearchResponse(  message: message ?? _message,
  data: data ?? _data,
  status: status ?? _status,
  code: code ?? _code,
);
  String? get message => _message;
  List<SearchData>? get data => _data;
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