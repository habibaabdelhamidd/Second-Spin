import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:graduation/core/constants.dart';
import 'package:graduation/models/home_model.dart';
import 'package:http/http.dart' as http;
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
}
