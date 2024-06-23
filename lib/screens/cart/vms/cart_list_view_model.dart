import 'package:graduation/models/cart/cart_list_model.dart';
import '../../../core/network_layer/api_manager.dart';
class CartListViewModel{
  List<CartList> allCartList =[];
  Api_Manager apiManager =  Api_Manager();
  Future <void> getAllCartProducts() async{
    allCartList = (await apiManager.fetchCartList())!;
  }
  Future<void> addtoCart(int id ) async{
    await apiManager.addToCart(id);
    await getAllCartProducts();
  }
  Future<void>removeFromCart(int id) async{
    await apiManager.removeFromCart(id);
    allCartList.removeAt(indexOfFavsProduct(id)!);
  }
  int? indexOfFavsProduct(int id) {
    for (int i = 0; i < allCartList.length; i++) {
      if (allCartList[i].id == id) {
        return i;
    }
    }
  }
}
