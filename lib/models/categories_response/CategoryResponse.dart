import 'category_data.dart';

/// message : "Products retrieved successfully"
/// data : [{"id":4,"title":"adidas","image":"http://www.secondspin.xyz/public/storage/SLhaJCMdLWuwVumvsyDcOYCun9rNPNo8.png","price":"560.00","location":"giza"},{"id":5,"title":"converse","image":"http://www.secondspin.xyz/public/storage/mmRS6QeW2tCMwMDDI75v227suPZakZwi.png","price":"1008.00","location":"cairo"},{"id":6,"title":"gucci bag","image":"http://www.secondspin.xyz/public/storage/sCk9S4TJoG93Y9VlIcgpPtstESiiYp0f.png","price":"1120.00","location":"cairo"},{"id":70,"title":"black bag","image":"http://www.secondspin.xyz/public/storage/jHH6RJwUrXcf4kb7LhFd8U0EEvxPmw4g.jpg","price":"291.20","location":"cairo"},{"id":71,"title":"brown bag","image":"http://www.secondspin.xyz/public/storage/Ca5jsOy4eBaSVUfI9QDX4O4WxF9jZyHS.jpg","price":"291.20","location":"cairo"},{"id":72,"title":"Blues Shoulder Bag","image":"http://www.secondspin.xyz/public/storage/sQF9l8i6uEJREAYSzGl6AtvIjGuRvrno.jpg","price":"481.60","location":"cairo"},{"id":73,"title":"Brown  Heel","image":"http://www.secondspin.xyz/public/storage/RyVFIzkkoQNPQzbJpVPIFHCdLcxNoG87.jpg","price":"784.00","location":"giza"},{"id":75,"title":"Leather Flat JK","image":"http://www.secondspin.xyz/public/storage/zcSUzMLbAgV2eue02UFzwKMNu621D5Aa.jpg","price":"739.20","location":"giza"},{"id":76,"title":"black heels","image":"http://www.secondspin.xyz/public/storage/6hmy40d2g154Ujj9h2T8mgtJZ16gzV90.jpg","price":"1008.00","location":"giza"},{"id":121,"title":"addidas","image":"http://secondspin.xyz/storage/app/public/cudB9So6Cuq05sJ3W1EhvcL6dd0aPLxD.jpg","price":"896.00","location":"giza"}]
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