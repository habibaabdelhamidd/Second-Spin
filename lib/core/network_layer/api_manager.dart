import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:graduation/core/constants.dart';
import 'package:graduation/models/categories_response/CategoryResponse.dart';
import 'package:graduation/models/fav/addtofav/add_to_fav.dart';
import 'package:graduation/models/home_model.dart';
import 'package:graduation/models/recyle/recycle_product_details_model.dart';
import 'package:graduation/models/response/AllCategoriesResponse.dart';
import 'package:graduation/models/search_response/SearchResponse.dart';
import 'package:graduation/screens/category/recycle/view_model/recycle_product_details_vm.dart';
import 'package:http/http.dart' as http;
import '../../models/recyle/all_recycle_model.dart';
class Api_Manager {
  Future<List<Data>?> fetchHome() async {
    final response = await http.get(
        Uri.http(
          Constants.api_base_URL ,
          "/api/products/home",
        ),
      headers:{
        "Authorization":"Bearer 7|Mg31lmlgv4yc0EcWuwYsb1lYGP1bV1XVnEae6Z5f25d6b3dd"
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
    // try{
    var response = await http.get(Uri.parse("http://secondspin.xyz/api/categories/used"),
        headers: { HttpHeaders.authorizationHeader:
          "Bearer 13|JBv81PCc2JdPH25kSaNz0ylYvpoxxU9txsEIeh8r97684cd8"
    });
    debugPrint(response.body);
    final result = jsonDecode(response.body);
    var allCategoriesResponse = AllCategoriesResponse.fromJson(result);
    return allCategoriesResponse;
    // }
    // catch (e) {S
    //   throw "Unable to retrieve posts.";
    // }
  }
  static Future<CategoryResponse> getCategory(num? categoryId) async {
    try {
    var response = await http.post(Uri.parse("http://secondspin.xyz/api/categories/product/10"),
        headers: { HttpHeaders.authorizationHeader:
        "Bearer 13|JBv81PCc2JdPH25kSaNz0ylYvpoxxU9txsEIeh8r97684cd8"
        });

    final result = jsonDecode(response.body);
    debugPrint(response.body);
    var categoryResponse = CategoryResponse.fromJson(result);
    return categoryResponse;}
    catch (e) {
      rethrow;
    }
  }
  static Future<SearchResponse>getSearch(String query) async {
    var response = await http.get(Uri.parse("http://secondspin.xyz//api/products/search?search$query"),
        headers: { HttpHeaders.authorizationHeader:
        "Bearer 13|JBv81PCc2JdPH25kSaNz0ylYvpoxxU9txsEIeh8r97684cd8"
        }
    );
    final result = jsonDecode(response.body);
    debugPrint(response.body);
    var searchResponse = SearchResponse.fromJson(result);
    return searchResponse;
  }
  Future<List<AllRecycle>?> fetchAllRecycl() async {
    final response = await http.get(
        Uri.http(
          Constants.api_base_URL ,
          "/api/categories/product/1",
        ),
        headers:{
          "Authorization":"Bearer 7|Mg31lmlgv4yc0EcWuwYsb1lYGP1bV1XVnEae6Z5f25d6b3dd"
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
  Future<ProdcuctData?> fetchGetProductDetails(int? productId) async {
    final response = await http.get(
        Uri.http(
          Constants.api_base_URL ,
          "/api/products/showDetails/$productId",
        ),
        headers:{
          "Authorization":"Bearer 13|JBv81PCc2JdPH25kSaNz0ylYvpoxxU9txsEIeh8r97684cd8"
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
    final response = await http.get(
        Uri.http(
          Constants.api_base_URL ,
          "/api/favorites/favoritelist",
        ),
        headers:{
          "Authorization":"Bearer 13|JBv81PCc2JdPH25kSaNz0ylYvpoxxU9txsEIeh8r97684cd8"
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
}
