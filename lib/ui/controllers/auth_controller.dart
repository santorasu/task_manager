import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_management/data/models/user_model.dart';

class AuthController{
  static String? token;
  static UserModel? userModel;

  static const String _tokenKey = 'token';
  static const String _userDataKey = 'user-data';

  // save user info
 static Future<void> saveUserInformation(String accessToken, UserModel userModel) async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString(_tokenKey, accessToken);
  sharedPreferences.setString(_userDataKey, jsonEncode(userModel.toJson()));

   token = accessToken;
   userModel = userModel;
  }

  // Get user info

static Future<void> getUserInformation() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? accessToken = sharedPreferences.getString(_tokenKey);
  String? saveUserModelString = sharedPreferences.getString(_tokenKey);

  if(saveUserModelString != null){
    UserModel saveUserModel = UserModel.formJson(jsonDecode(saveUserModelString));
    userModel = saveUserModel;
  }
  token = accessToken;
}
}