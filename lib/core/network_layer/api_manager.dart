import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/core/constants.dart';
import 'package:graduation/core/shared_preference.dart';
import 'package:graduation/models/cart/cart_list_model.dart';
import 'package:graduation/models/cart/payment_model.dart';
import 'package:graduation/models/categories_response/CategoryResponse.dart';
import 'package:graduation/models/category_list/CategoryList.dart';
import 'package:graduation/models/charities_response/CharitiesResponse.dart';
import 'package:graduation/models/details_response/Data.dart';
import 'package:graduation/models/fav/addtofav/add_to_fav.dart';
import 'package:graduation/models/home_model.dart';
import 'package:graduation/models/recyle/recycle_product_details_model.dart';
import 'package:graduation/models/response/AllCategoriesResponse.dart';
import 'package:graduation/screens/account/account_viwe_screen/account.dart';
import 'package:graduation/screens/cart/cart_view/cart_user_data.dart';
import 'package:graduation/screens/home/view_model/view_model.dart';
import 'package:http/http.dart' as http;
import '../../models/details_response/DetailsResponse.dart';
import 'package:graduation/models/search_response/SearchResponse.dart';
import '../../models/recyle/all_recycle_model.dart';
import 'package:dio/dio.dart';

class Api_Manager {
  Future<List<Data>?> fetchHome() async {
    String? token = await Preference.getToken();
    print("home $token");
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
    debugPrint(response.body);
    final result = jsonDecode(response.body);
    var charitiesResponse = CharitiesResponse.fromJson(result);
    return charitiesResponse;
  }

  // Future<DonationFormRes> donate(
  //   num? donationId,
  //   String? description,
  //   String? title,
  //   String? location,
  //   String? locationDetails,
  //   String? imagePath,
  // ) async {
  //   String? token = await Preference.getToken();
  //   var response = await http.post(
  //       Uri.parse("http://secondspin.xyz/api/donations/store/$donationId"),
  //       headers: {
  //         HttpHeaders.authorizationHeader: "Bearer $token",
  //         HttpHeaders.contentTypeHeader: "application/json",
  //       },
  //       body: jsonEncode(<String, dynamic>{
  //         "description": description,
  //         "title": title,
  //         "location": location,
  //         "location_details": locationDetails,
  //         "image": imagePath,
  //         'charity_id' : donationId
  //       }));
  //   if (response.statusCode == 201) {
  //     print(response.body);
  //   }
  //   final result = jsonDecode(response.body);
  //   print(response.body);
  //   var donationResponse = DonationFormRes.fromJson(result);
  //   return donationResponse;
  // }
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
    final response = await http.post(
        Uri.http(Constants.api_base_URL, "/api/favorites/delete/$id"),
        headers: {"Authorization": "Bearer $token"});
    final decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200 && decodedResponse['status'] == true) {
      return true;
    } else
      return false;
  }

  Future<bool> removeFromCart(int id) async {
    String? token = await Preference.getToken();
    final response = await http.post(
        Uri.http(Constants.api_base_URL, "/api/carts/delete/$id"),
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
  static Future <void>sendApiRequest() async {
    try {
      String? token = await Preference.getToken();
      final feedbackuser = feedback.text;
      final dio = Dio();
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      final body = {
        'comment': feedbackuser,
      };
      final response = await dio.post(
        'http://secondspin.xyz/api/userprofiles/feedback',
        options: Options(headers: headers , followRedirects: true,),
        data: body,
      );
      print('Status code: ${response.statusCode}');
      print('Response data: ${response.data}');
    } catch (e) {
      print('Error: $e');
    }
  }
  static void deleteAccount() async {
    String? token = await Preference.getToken();
    final response = await http.post(
        Uri.http(Constants.api_base_URL, "/api/userprofile/deleteprofile"),
        headers: {"Authorization": "Bearer $token"});
    final decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200 && decodedResponse['status'] == true) {
      print("success");
    } else {
      print("error");
    }
  }
  static void logOut() async {
    String? token = await Preference.getToken();
    final response = await http.post(
        Uri.http(Constants.api_base_URL, "/api/auth/logout/"),
        headers: {"Authorization": "Bearer $token"});
    final decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200 && decodedResponse['status'] == true) {
      print("success");
    } else {
      print("error");
    }
  }
  static void checkoutData() async {
    String? token = await Preference.getToken();
    final inputLocation = dropDownCurrentValue;
    final locationDetails = userLocationDetails.text;
    final paymentMethod = currentPaymentMethodOptions;
    final cardNumber = creditNum.text;
    final cvv = cvV.text;
    final expirydate = expire.text;
    final response = await http.post(
      Uri.http(Constants.api_base_URL, "/api/orders/checkout"),
      headers: {"Authorization": "Bearer $token"},
      body: jsonEncode({
        "location": inputLocation,
        "location_details": locationDetails,
        "payment_method": paymentMethod,
        "card_number": cardNumber,
        "cvv": cvv,
        "expiry_date": expirydate,
      }),
    );
    // final decodedResponse = jsonDecode(response.body);
    // print(decodedResponse);
    // return;
    if (response.statusCode == 201 ) {
      print("success");
    } else {
      print(response.statusCode);
    }
  }
  // Future<PaymentData?> fetchPaymentSummary() async {
  //   String? token = await Preference.getToken();
  //   final response = await http.get(
  //       Uri.http(
  //         Constants.api_base_URL,
  //         "/api/orders/paymentSummary",
  //       ),
  //       headers: {"Authorization": "Bearer $token"});
  //   final decodedResponse = jsonDecode(response.body);
  //   if (response.statusCode == 200 && decodedResponse["status"] == true) {
  //     final paymentData =
  //     PaymentModel.fromJson(decodedResponse);
  //     return paymentData.data;
  //   } else {
  //     throw Exception('Failed to load products');
  //   }
  // }
}
