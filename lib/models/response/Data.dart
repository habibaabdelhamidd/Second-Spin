/// id : 2
/// name : "Clothes"

class Category {
  Category({
      int? id,
      String? name,}){
    _id = id;
    _name = name;
}
  Category.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  int? _id;
  String? _name;
Category copyWith({  int? id,
  String? name,
}) => Category(  id: id ?? _id,
  name: name ?? _name,
);
  int? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}