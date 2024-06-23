import 'package:graduation/core/favorites_manager.dart';
import 'package:graduation/core/network_layer/api_manager.dart';

import '../../../models/home_model.dart';

class HomeViewModel{
  List<Data>suggestionsProducts =[];
  Api_Manager apiManager =  Api_Manager();
 Future <void> getSuggtionsModel() async{
   await FavoritesManager.getInstance().getFavs();
   final templest = (await apiManager.fetchHome())!;
  suggestionsProducts= FavoritesManager.getInstance().retrieveData(templest as List<Data>) as List<Data>;
  }
  Future<void> addtofav(int id ) async{
   FavoritesManager.getInstance().addFav(id);
  }
  Future<void> removeFromFav (int id )async{
   FavoritesManager.getInstance().removeFav(id);
  }
}