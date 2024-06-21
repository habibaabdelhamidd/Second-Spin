class PaymentModel {
  String? message;
  PaymentData? data;
  bool? status;
  int? code;
  PaymentModel({this.message, this.data, this.status, this.code});
  PaymentModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new PaymentData.fromJson(json['data']) : null;
    status = json['status'];
    code = json['code'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    data['code'] = this.code;
    return data;
  }
}
class PaymentData {
  int? id;
  String? total;
  String? deliveryFees;
  String? totalPrice;
  PaymentData({this.id, this.total, this.deliveryFees, this.totalPrice});
  PaymentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    deliveryFees = json['delivery_fees'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['total'] = this.total;
    data['delivery_fees'] = this.deliveryFees;
    data['total_price'] = this.totalPrice;
    return data;
  }
}