import 'package:graduation/models/recyle/recycle_product_details_model.dart';
import '../../../../core/network_layer/api_manager.dart';
class RecycleProductDetailsVm{
  ProdcuctData? prodcuctData ;
  Future <void> getProductData() async{
  Api_Manager apiManager =  Api_Manager();
  prodcuctData= (await apiManager.fetchGetProductDetails(prodcuctData?.id));
  }

}