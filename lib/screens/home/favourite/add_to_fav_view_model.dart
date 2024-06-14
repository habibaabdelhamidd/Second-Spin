import 'package:graduation/models/fav/addtofav/add_to_fav.dart';
import '../../../core/network_layer/api_manager.dart';

class AddToFavViewModel{
  List<FavProductList> allFavProducts =[];
  Future <void> getAllFavProducts() async{
    Api_Manager apiManager =  Api_Manager();
    allFavProducts= (await apiManager.fetchAllFavList())!;
  }
}