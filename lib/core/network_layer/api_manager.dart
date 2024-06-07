import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:graduation/core/constants.dart';
import 'package:graduation/models/categories_response/CategoryResponse.dart';
import 'package:graduation/models/home_model.dart';
import 'package:graduation/models/response/AllCategoriesResponse.dart';
import 'package:http/http.dart' as http;

class Api_Manager {
  Future<List<Data>?> fetchHome() async {
    final response = await http.get(
      Uri.parse(
          // Constants.Ai_base_URLp + "/api/products/home",
          "http://127.0.0.1:8000/api/products/home"),
      // headers:{
      //   "Access-Control-Allow-Origin": "*",
      //   "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT,DELETE,HEAD"
      // }
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
}
