import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:graduation/core/constants.dart';
import 'package:graduation/core/shared_preference.dart';
import 'package:graduation/models/categories_response/CategoryResponse.dart';
import 'package:graduation/models/fav/addtofav/add_to_fav.dart';
import 'package:graduation/models/home_model.dart';
import 'package:graduation/models/recyle/recycle_product_details_model.dart';
import 'package:graduation/models/response/AllCategoriesResponse.dart';
import 'package:http/http.dart' as http;
import '../../models/details_response/DetailsResponse.dart';
import 'package:graduation/models/search_response/SearchResponse.dart';
import '../../models/recyle/all_recycle_model.dart';
class Api_Manager {
  Future<List<Data>?> fetchHome() async {
    String? token = await Preference.getToken();
    final response = await http.get(
        Uri.http(
          Constants.api_base_URL ,
          "/api/products/home",
        ),
      headers:{
        "Authorization":"Bearer $token"
      }
    );
    final decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200 && decodedResponse["status"] == true) {
      final homemodel = HomeModel.fromJson(decodedResponse);
      return homemodel.allDate;
    } else {
      throw Exception('Failed to load products');
    }
  }

  static Future<AllCategoriesResponse> getAllCategories() async {
    String? token = await Preference.getToken();
    var response = await http.get(Uri.parse("http://secondspin.xyz/api/categories/used"),
        headers: { HttpHeaders.authorizationHeader:
          "Bearer $token"
    });
    debugPrint(response.body);

    final result = jsonDecode(response.body);
    var allCategoriesResponse = AllCategoriesResponse.fromJson(result);
    return allCategoriesResponse;
  }

  static Future<CategoryResponse>getCategory(num? categoryId) async {
    try {
      String? token = await Preference.getToken();
    var response = await http.get(Uri.parse("http://secondspin.xyz/api/categories/product/$categoryId"),
        headers: { HttpHeaders.authorizationHeader:
        "Bearer $token"
        });
    debugPrint(response.body);
    final result = jsonDecode(response.body);
    debugPrint(response.body);
    var categoryResponse = CategoryResponse.fromJson(result);
    return categoryResponse;}
    catch (e) {
      rethrow;
    }
  }
  Future<List<AllRecycle>?> fetchAllRecycl() async {
    String? token = await Preference.getToken();
    final response = await http.get(
        Uri.http(
          Constants.api_base_URL ,
          "/api/categories/product/1",
        ),
        headers:{
          "Authorization":"Bearer $token"
        }
    );
    final decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200 && decodedResponse["status"] == true) {
      final allRecyclModel = AllRecycleModel.fromJson(decodedResponse);
      return allRecyclModel.all_rec;
    } else {
      throw Exception('Failed to load products');
    }
  }

  static Future<DetailsResponse>getDetails(num? detailsId) async {
    String? token = await Preference.getToken();
      var response = await http.get(Uri.parse("http://secondspin.xyz/api/products/showDetails/$detailsId"),
          headers: { HttpHeaders.authorizationHeader:
          "Bearer $token"
          });

      final result = jsonDecode(response.body);
      debugPrint(response.body);
      var detailsResponse = DetailsResponse.fromJson(result);
      return detailsResponse;
  }

  static Future<SearchResponse>getSearch(String query) async {
    String? token = await Preference.getToken();
      var response = await http.get(Uri.parse("http://secondspin.xyz/api/products/search?search=$query"),
          headers: { HttpHeaders.authorizationHeader:
          "Bearer $token"
          });

      final result = jsonDecode(response.body);
      debugPrint(response.body);
      var searchResponse = SearchResponse.fromJson(result);
      return searchResponse;}
  // static Future<LoginResponse>login(String email, String password) async {
  //   var response = await http.post(
  //     Uri.parse("http://secondspin.xyz/api/auth/login"),
  //     headers: { HttpHeaders.authorizationHeader:
  //     "Bearer 13|JBv81PCc2JdPH25kSaNz0ylYvpoxxU9txsEIeh8r97684cd8",
  //       HttpHeaders.contentTypeHeader: "application/json",
  //     },
  //     body: jsonEncode(<String, dynamic>{
  //       "password": password,
  //       "email": email
  //     })
  //   );
  //   // if(response.statusCode == 200){
  //   //   print("success");
  //   // }
  //   // else{
  //   //   print("failed");
  //   // }
  //
  //   final result = jsonDecode(response.body);
  //   print(response.body);
  //   var loginResponse = LoginResponse.fromJson(result);
  //   return loginResponse;
  // }
  Future<ProdcuctData?> fetchGetProductDetails(int? productId) async {
    String? token = await Preference.getToken();
    final response = await http.get(
        Uri.http(
          Constants.api_base_URL ,
          "/api/products/showDetails/$productId",
        ),
        headers:{
          "Authorization":"Bearer $token"
        }
    );
    final decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200 && decodedResponse["status"] == true) {
      final productDetails  = RecycleProductDetailsModel.fromJson(decodedResponse);
      return productDetails.data;
    } else {
      throw Exception('Failed to load products');
    }
  }
  Future<List<FavProductList>?> fetchAllFavList() async {
    String? token = await Preference.getToken();
    final response = await http.get(
        Uri.http(
          Constants.api_base_URL ,
          "/api/favorites/favoritelist",
        ),
        headers:{
          "Authorization":"Bearer $token"
        }
    );
    final decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200 && decodedResponse["status"] == true) {
      final favList  = AddToFavModel.fromJson(decodedResponse);
      return favList.data;
    } else {
      throw Exception('Failed to load products');
    }
  }
  Future<bool>addToFav ( int id ) async{
    String? token = await Preference.getToken();
    print("befor token add $id");
    final response = await http.post(
      Uri.http(
        Constants.api_base_URL ,
          "/api/favorites/store/$id"
      ),
        headers:{
          "Authorization":"Bearer $token"
        }
    );
    final decodedResponse = jsonDecode(response.body);
    if(response.statusCode == 201 && decodedResponse['status']==true) {
      return true ;
    } else return false ;
  }
  Future<bool>removeFromFav ( int id ) async{
    String? token = await Preference.getToken();
    print("befor token remove $id");
    final response = await http.post(
        Uri.http(
            Constants.api_base_URL ,
            "/api/favorites/delete/$id"
        ),
        headers:{
          "Authorization":"Bearer $token"
        }
    );
    final decodedResponse = jsonDecode(response.body);
    if(response.statusCode == 200 && decodedResponse['status']==true) {
      return true ;
    } else return false ;
  }

}
