import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:graduation/core/constants.dart';
import 'package:graduation/core/shared_preference.dart';
import 'package:graduation/models/cart/cart_list_model.dart';
import 'package:graduation/models/categories_response/CategoryResponse.dart';
import 'package:graduation/models/charities_response/CharitiesResponse.dart';
import 'package:graduation/models/details_response/Data.dart';
import 'package:graduation/models/fav/addtofav/add_to_fav.dart';
import 'package:graduation/models/home_model.dart';
import 'package:graduation/models/recyle/recycle_product_details_model.dart';
import 'package:graduation/models/response/AllCategoriesResponse.dart';
import 'package:http/http.dart' as http;
import '../../models/category_list/CategoryList.dart';
import '../../models/details_response/DetailsResponse.dart';
import 'package:graduation/models/search_response/SearchResponse.dart';
import '../../models/edit_profile/EditProfile.dart';
import '../../models/recyle/all_recycle_model.dart';
import '../../models/register_response/RegisterResponse.dart';

class Api_Manager {
  Future<List<Data>?> fetchHome() async {
    String? token = await Preference.getToken();
    final response = await http.get(
        Uri.http(
          Constants.api_base_URL,
          "/api/products/home",
        ),
        headers: {"Authorization": "Bearer $token"});
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
    var response = await http.get(
        Uri.parse("http://secondspin.xyz/api/categories/used"),
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
    debugPrint(response.body);

    final result = jsonDecode(response.body);
    var allCategoriesResponse = AllCategoriesResponse.fromJson(result);
    return allCategoriesResponse;
  }

  static Future<CategoryResponse> getCategory(num? categoryId) async {
    try {
      String? token = await Preference.getToken();
      var response = await http.get(
          Uri.parse("http://secondspin.xyz/api/categories/product/$categoryId"),
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
      debugPrint(response.body);
      final result = jsonDecode(response.body);
      debugPrint(response.body);
      var categoryResponse = CategoryResponse.fromJson(result);
      return categoryResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<AllRecycle>?> fetchAllRecycl() async {
    String? token = await Preference.getToken();
    final response = await http.get(
        Uri.http(
          Constants.api_base_URL,
          "/api/categories/product/1",
        ),
        headers: {"Authorization": "Bearer $token"});
    final decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200 && decodedResponse["status"] == true) {
      final allRecyclModel = AllRecycleModel.fromJson(decodedResponse);
      return allRecyclModel.all_rec;
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<DetailsData?> getDetails(num? detailsId) async {
    String? token = await Preference.getToken();
    var response = await http.get(
        Uri.parse("http://secondspin.xyz/api/products/showDetails/$detailsId"),
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
    final decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200 && decodedResponse["status"] == true) {
      final result = jsonDecode(response.body);
      debugPrint(response.body);
      var detailsResponse = DetailsResponse.fromJson(result);
      return detailsResponse.data;
    }
  }

  static Future<SearchResponse> getSearch(String query) async {
    String? token = await Preference.getToken();
    var response = await http.get(
        Uri.parse("http://secondspin.xyz/api/products/search?search=$query"),
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"});

    final result = jsonDecode(response.body);
    debugPrint(response.body);
    var searchResponse = SearchResponse.fromJson(result);
    return searchResponse;
  }

  Future<ProdcuctData?> fetchGetProductDetails(int? productId) async {
    String? token = await Preference.getToken();
    final response = await http.get(
        Uri.http(
          Constants.api_base_URL,
          "/api/products/showDetails/$productId",
        ),
        headers: {"Authorization": "Bearer $token"});
    final decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200 && decodedResponse["status"] == true) {
      final productDetails =
          RecycleProductDetailsModel.fromJson(decodedResponse);
      return productDetails.data;
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<FavProductList>?> fetchAllFavList() async {
    String? token = await Preference.getToken();
    final response = await http.get(
        Uri.http(
          Constants.api_base_URL,
          "/api/favorites/favoritelist",
        ),
        headers: {"Authorization": "Bearer $token"});
    final decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200 && decodedResponse["status"] == true) {
      final favList = AddToFavModel.fromJson(decodedResponse);
      return favList.data;
    } else {
      throw Exception('Failed to load products');
    }
  }

  static Future<CharitiesResponse> getCharities() async {
    String? token = await Preference.getToken();
    var response = await http.get(
        Uri.parse("http://secondspin.xyz/api/donations/charities"),
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
    // debugPrint(response.body);
    final result = jsonDecode(response.body);
    var charitiesResponse = CharitiesResponse.fromJson(result);
    return charitiesResponse;
  }

  static Future<CategoryList> listCategories() async {
    String? token = await Preference.getToken();
    var response = await http.get(
        Uri.parse("http://secondspin.xyz/api/categories/allcategories"),
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
    debugPrint(response.body);

    final result = jsonDecode(response.body);
    var listResponse = CategoryList.fromJson(result);
    return listResponse;
  }

  Future<bool> addToFav(int id) async {
    String? token = await Preference.getToken();
    final response = await http.post(
        Uri.http(Constants.api_base_URL, "/api/favorites/store/$id"),
        headers: {"Authorization": "Bearer $token"});
    final decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 201 && decodedResponse['status'] == true) {
      return true;
    } else
      return false;
  }

  Future<bool> addToCart(int id) async {
    String? token = await Preference.getToken();
    final response = await http.post(
        Uri.http(Constants.api_base_URL, "/api/carts/store/$id"),
        headers: {"Authorization": "Bearer $token"});
    final decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 201 && decodedResponse['status'] == true) {
      return true;
    } else
      return false;
  }

  Future<bool> removeFromFav(int id) async {
    String? token = await Preference.getToken();
    print("befor token remove $id");
    final response = await http.post(
        Uri.http(Constants.api_base_URL, "/api/favorites/delete/$id"),
        headers: {"Authorization": "Bearer $token"});
    final decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200 && decodedResponse['status'] == true) {
      return true;
    } else
      return false;
  }

  Future<List<CartList>?> fetchCartList() async {
    String? token = await Preference.getToken();
    final response = await http.get(
        Uri.http(
          Constants.api_base_URL,
          "/api/carts/cartlist",
        ),
        headers: {"Authorization": "Bearer $token"});
    final decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200 && decodedResponse["status"] == true) {
      final cartList = CartListModel.fromJson(decodedResponse);
      return cartList.data;
    } else {
      throw Exception('Failed to load products');
    }
  }

  static Future<EditProfile> editProfile(String email, String password, String name) async {
    String? token = await Preference.getToken();
        final body = jsonEncode(<String, dynamic>{
          "name": name,
          "email": email,
          "password": password,});
    print('Request Body: $body');
    var response = await http.post(
        Uri.parse("http://secondspin.xyz/api/userprofile/editprofile"),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: "application/json",
        });

    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');
    if (response.statusCode == 200) {
      print(response.body);
    }  else {
      final result = jsonDecode(response.body);
      throw Exception('Failed to sell item: ${result['message']}');
    }
    final result = jsonDecode(response.body);
    var editResponse = EditProfile.fromJson(result);
    return editResponse;
  }
}
