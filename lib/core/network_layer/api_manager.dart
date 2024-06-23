import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/core/constants.dart';
import 'package:graduation/core/shared_preference.dart';
import 'package:graduation/models/cart/cart_list_model.dart';
import 'package:graduation/models/cart/payment_model.dart';
import 'package:graduation/models/categories_response/CategoryResponse.dart';
import 'package:graduation/models/details_response/Data.dart';
import 'package:graduation/models/fav/addtofav/add_to_fav.dart';
import 'package:graduation/models/get_user/Data.dart';
import 'package:graduation/models/home_model.dart';
import 'package:graduation/models/recyle/recycle_product_details_model.dart';
import 'package:graduation/models/response/AllCategoriesResponse.dart';
import 'package:graduation/screens/account/account_viwe_screen/account.dart';
import 'package:graduation/screens/cart/cart_view/cart_user_data.dart';
import 'package:graduation/screens/home/view_model/view_model.dart';
import 'package:http/http.dart' as http;
import '../../models/category_list/CategoryList.dart';
import '../../models/charities_response/CharityData.dart';
import '../../models/details_response/DetailsResponse.dart';
import 'package:graduation/models/search_response/SearchResponse.dart';
import '../../models/get_user/GetUser.dart';
import '../../models/profile_pic/AddPic.dart';
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

  static Future<CategoryResponse> getCategory(int? categoryId) async {
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

  Future<DetailsData?> getDetails(int? detailsId) async {
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

   Future<CharityData?> getCharities() async {
    String? token = await Preference.getToken();
    var response = await http.get(
        Uri.parse("http://secondspin.xyz/api/donations/charities"),
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
    // debugPrint(response.body);
    final result = jsonDecode(response.body);
    var charitiesResponse = CharityData.fromJson(result);
    return charitiesResponse;
  }


   Future<CategoryList> listCategories() async {
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


  //  static Future<EditProfile> editProfile(String email, String password, String name,String image) async {
  //   String? token = await Preference.getToken();
  //   var response = await http.post(
  //       Uri.parse("http://www.secondspin.xyz/api/userprofiles/editprofile"),
  //       headers: {
  //         HttpHeaders.authorizationHeader: "Bearer $token",
  //         HttpHeaders.contentTypeHeader: "application/json",
  //       });
  //       final body = jsonEncode(<String, dynamic>{
  //         "name": name,
  //         "email": email,
  //         "password": password,
  //       "image" : image});
  //   print('Request Body: $body');
  //   final result = jsonDecode(response.body);
  //   var editResponse = EditProfile.fromJson(result);
  //   print('Response Status: ${response.statusCode}');
  //
  //   if (response.statusCode == 200) {
  //     print('Response Body: ${response.body}');
  //     return editResponse;
  //   }  else {
  //     final result = jsonDecode(response.body);
  //     throw Exception('Failed to sell item: ${result['message']}');
  //   }
  //
  //
  // }

   Future<GetUserData?> userData() async {
    String? token = await Preference.getToken();
    var response = await http.get(
        Uri.parse("http://secondspin.xyz/api/userprofiles/getuser"),
        headers: {HttpHeaders.authorizationHeader: "Bearer $token",
      HttpHeaders.contentTypeHeader: "application/json",});
    debugPrint(response.body);
    if (response.statusCode == 200) {
      print('Response Body: ${response.body}');
    }
    final result = jsonDecode(response.body);
    var userResponse = GetUser.fromJson(result);
    return userResponse.data;
  }

  // static Future<AddPic> getPic() async {
  //   String? token = await Preference.getToken();
  //   var response = await http.get(
  //       Uri.parse("http://secondspin.xyz/api/userprofiles/uploadimage"),
  //       headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
  //
  //   final result = jsonDecode(response.body);
  //   debugPrint(response.body);
  //   var picResponse = AddPic.fromJson(result);
  //   return picResponse;
  // }

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
  static Future <void>sendCheckoutRequest() async {
    try {
      String? token = await Preference.getToken();
      final locataionCity = dropDownCurrentValue;
      final locationDetails = userLocationDetails.text;
      final creditCardN=creditNum.text;
      final expiryDate = expire.text;
      final cardCvv = cvV.text;
      final currentPayment = payment!;
      print(locationDetails);
      print(cardCvv);
      print(expiryDate);
      print(creditCardN);
      print(locataionCity);
      print(payment);
      final dio = Dio();
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      final body ={
        'location': locataionCity,
        'payment_method' : currentPayment,
        'location_details': locationDetails,
        'card_number' : creditCardN,
        'cvv' : cardCvv ,
        'expiry_date' : expiryDate ,
      };
      final response = await dio.post(
        'http://secondspin.xyz/api/orders/checkout',
        options:Options(
        headers: headers,
        followRedirects: true,
      ),
        data: body,
      );
      print('Status code: ${response.statusCode}');
      print('Response data: ${response.data}');
    } catch (e) {
      print('Error: $e');
    }
  }
  Future<PaymentData?> fetchPaymentSummary() async {
    String? token = await Preference.getToken();
    final response = await http.get(
        Uri.http(
          Constants.api_base_URL ,
          "/api/orders/paymentSummary",
        ),
        headers: {"Authorization": "Bearer $token"});
    final decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200 && decodedResponse["status"] == true) {
      final paymentData = PaymentModel.fromJson(decodedResponse);
      return paymentData.data;
    } else {
      throw Exception('Failed to load products');
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
