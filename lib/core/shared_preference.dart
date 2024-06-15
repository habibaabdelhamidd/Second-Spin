import 'package:shared_preferences/shared_preferences.dart';
class Preference{
 static late SharedPreferences prefs;
static Future<String?> getToken()async{
 final SharedPreferences prefs = await SharedPreferences.getInstance();
 return prefs.getString('token');
}
static saveToken(String? tokenValue)async{
 await prefs.setString('token', tokenValue!);
}
}
