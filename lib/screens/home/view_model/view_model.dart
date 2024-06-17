import 'package:graduation/core/network_layer/api_manager.dart';

import '../../../models/home_model.dart';

class HomeViewModel{
  List<Data>suggestionsProducts =[];
  Api_Manager apiManager =  Api_Manager();
 Future <void> getSuggtionsModel() async{
   suggestionsProducts= (await apiManager.fetchHome())!;
  }
  Future<void> addtofav(int id ) async{
   await apiManager.addToFav(id);
  }
  Future<void> removeFromFav (int id )async{
   await apiManager.removeFromFav(id);
  }
}