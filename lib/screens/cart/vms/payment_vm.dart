import 'package:graduation/models/cart/payment_model.dart';

import '../../../core/network_layer/api_manager.dart';

class PaymentVm{
  PaymentData? paymentData;
  Api_Manager apiManager =  Api_Manager();
  Future <void> getPaymentData() async{
    paymentData= (await apiManager.fetchPaymentSummary());
  }
}