import 'package:graduation/core/network_layer/api_manager.dart';
import '../models/fav/addtofav/add_to_fav.dart';
class FavoritesManager {
  // Make constructor private
  FavoritesManager._() {}
  static FavoritesManager? _instance;
  Api_Manager api_manager =Api_Manager();
  List<FavProductList> favs = [];
  static FavoritesManager getInstance() {
    _instance ??= FavoritesManager._();
    return _instance!;
  }
  Future<void> getFavs() async {
    print("=============================================================");
    print("get favorites from favorites manager");
    print("=============================================================");
    favs = (await Api_Manager.fetchAllFavList()!)!;
  }

  Future<void> addFav(int productId) async {
    await api_manager.addToFav(productId!);
     getFavs();
  }
  Future<void> removeFav(int productId) async {
    await api_manager.removeFromFav(productId!);
    // getFavs();
    favs.removeAt(indexOfFavsProduct(productId)!);
  }
  List retrieveData(List<dynamic> data) {
    for (int i = 0; i < data.length; i++) {
      for (int j = 0; j < favs.length; j++) {
        if (data[i].id == favs[j].product_id) {
          data[i].isfav = true;
          break;
        }
      }
    }
    return data;
  }
  int? indexOfFavsProduct(int id) {
    for (int i = 0; i < favs.length; i++) {
      if (favs[i].id == id) {
        return i;
      }
    }
  }
}
