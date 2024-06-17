import '../../../../core/network_layer/api_manager.dart';
import '../../../../models/recyle/all_recycle_model.dart';

class AllRecyclViewModel{
  List<AllRecycle> allRecyclProductsView =[];
  Api_Manager apiManager =  Api_Manager();
  Future <void> getAllRecyclProducts() async{
    allRecyclProductsView= (await apiManager.fetchAllRecycl())!;
  }
  Future<void> addtofav(int id ) async{
    await apiManager.addToFav(id);
  }
  Future<void> removeFromFav (int id )async{
    await apiManager.removeFromFav(id);
  }
}