import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:graduation/core/constants.dart';
import 'package:graduation/models/categories_response/CategoryResponse.dart';
import 'package:graduation/models/home_model.dart';
import 'package:graduation/models/recyle/recycle_product_details_model.dart';
import 'package:graduation/models/response/AllCategoriesResponse.dart';
import 'package:http/http.dart' as http;
import '../../models/details_response/DetailsResponse.dart';
import '../../models/loginResponse/LoginResponse.dart';
import '../../models/recyle/all_recycle_model.dart';
import '../../models/search_response/SearchResponse.dart';
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

  static Future<CategoryResponse>getCategory(num? categoryId) async {
    try {
    var response = await http.get(Uri.parse("http://secondspin.xyz/api/categories/product/$categoryId"),
        headers: { HttpHeaders.authorizationHeader:
        "Bearer 13|JBv81PCc2JdPH25kSaNz0ylYvpoxxU9txsEIeh8r97684cd8"
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
  static Future<DetailsResponse>getDetails(num? detailsId) async {
      var response = await http.get(Uri.parse("http://secondspin.xyz/api/products/showDetails/$detailsId"),
          headers: { HttpHeaders.authorizationHeader:
          "Bearer 13|JBv81PCc2JdPH25kSaNz0ylYvpoxxU9txsEIeh8r97684cd8"
          });

      final result = jsonDecode(response.body);
      debugPrint(response.body);
      var detailsResponse = DetailsResponse.fromJson(result);
      return detailsResponse;
  }

  static Future<SearchResponse>getSearch(String query) async {
      var response = await http.get(Uri.parse("http://secondspin.xyz/api/products/search?search=$query"),
          headers: { HttpHeaders.authorizationHeader:
          "Bearer 13|JBv81PCc2JdPH25kSaNz0ylYvpoxxU9txsEIeh8r97684cd8"
          });

      final result = jsonDecode(response.body);
      debugPrint(response.body);
      var searchResponse = SearchResponse.fromJson(result);
      return searchResponse;}


  static Future<LoginResponse>login(String email, String password) async {
    var response = await http.post(
      Uri.parse("http://secondspin.xyz/api/auth/login"),
      headers: { HttpHeaders.authorizationHeader:
      "Bearer 13|JBv81PCc2JdPH25kSaNz0ylYvpoxxU9txsEIeh8r97684cd8"
      },
      body: jsonEncode(<String, dynamic>{
        "password": password,
        "email": email
      })
    );

    final result = jsonDecode(response.body);
    print(response.body);
    var loginResponse = LoginResponse.fromJson(result);
    return loginResponse;
  }

  Future<ProdcuctData?> fetchGetProductDetails(int? productId) async {
    final response = await http.get(
        Uri.http(
          Constants.api_base_URL ,
          "/api/products/showDetails/$productId",
        ),
        headers:{
          "Authorization":"Bearer 7|Mg31lmlgv4yc0EcWuwYsb1lYGP1bV1XVnEae6Z5f25d6b3dd"
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
}
