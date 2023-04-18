import 'dart:convert';

import 'package:blockchain/const/constant.dart';
import 'package:blockchain/helper/local.dart';
import 'package:blockchain/model/user/jwt.dart';
import 'package:blockchain/view/pages/navigation/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthService {
  var userId;
  LocalHelper localHelper = LocalHelper();
  Future register(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse('$LOGIN_URL/registerUser'),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(<String, String>{
        "emailId": email,
        "password": password,
        "name": name,
        "type": "org_admin"
      }),
    );

    String userId = response.body.toString();
    // print(userId);
    Get.showSnackbar(GetSnackBar(
      title: "User Registered Successfully \n User Id:",
      message: "please note down your user id for future reference",
      messageText: Text(
        userId,
        style: const TextStyle(color: Colors.white),
      ),
      duration: const Duration(seconds: 30),
      snackPosition: SnackPosition.BOTTOM,
    ));
    localHelper.storeOrgNet("ID", userId);
    localHelper.storeOrgNet("isLogin", "true");
    Get.to(() => const SideBar());

    return userId;
  }

  Future login(String email, String password) async {
    final response = await http.post(Uri.parse('$LOGIN_URL/login'),
        // headers: <String, String>{'Content-Type': 'application/json'},
        body: {
          "ID": email,
          "password": password,
        });
    var res = LoginModel.fromJson(jsonDecode(response.body));
    if (res.authenticated == "true") {
      // print(response.body);
      LocalHelper localHelper = LocalHelper();
      localHelper.storeOrgNet("AccessToken", res.accessToken.toString());
      // print(res.accessToken.toString());
      return res;
    } else {
      throw Exception('Failed to login user.');
    }
  }

  Future queryUser(String str) async {
    final respone =
        http.post(Uri.parse('$LOGIN_URL/queryUser'), body: {"ID": str});
    var res = jsonDecode((await respone).body);

    // print(jsonObject);
    return res;
  }
}
