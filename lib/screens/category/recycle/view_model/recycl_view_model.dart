import '../../../../core/network_layer/api_manager.dart';
import '../../../../models/recyle/all_recycle_model.dart';

class AllRecyclViewModel{
  List<AllRecycle> allRecyclProductsView =[];
  Future <void> getAllRecyclProducts() async{
    Api_Manager apiManager =  Api_Manager();
    allRecyclProductsView= (await apiManager.fetchAllRecycl())!;
  }
}