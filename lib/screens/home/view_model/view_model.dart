import 'package:graduation/core/network_layer/api_manager.dart';

import '../../../models/home_model.dart';

class HomeViewModel{
  List<Data>suggestionsProducts =[];
 Future <void> getSuggtionsModel() async{
    Api_Manager apiManager =  Api_Manager();
   suggestionsProducts= (await apiManager.fetchHome())!;
  }
}