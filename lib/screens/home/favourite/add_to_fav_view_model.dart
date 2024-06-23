import 'package:graduation/models/fav/addtofav/add_to_fav.dart';
import '../../../core/network_layer/api_manager.dart';

class AddToFavViewModel{
  List<FavProductList> allFavProducts =[];
  Api_Manager apiManager =  Api_Manager();
  Future <void> getAllFavProducts() async{
    allFavProducts= (await Api_Manager.fetchAllFavList())!;
  }
  Future<void> addtofav(int id ) async{
    await apiManager.addToFav(id);
  }
  Future<void> addtoCart(int id ) async{
    await apiManager.addToCart(id);
  }
  Future<void> removeFromFav (int id )async{
    await apiManager.removeFromFav(id);
  }
}