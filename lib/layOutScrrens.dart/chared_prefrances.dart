import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CachHelper {
  static SharedPreferences? sharedpreferences;
  static init() async {
    sharedpreferences = await SharedPreferences.getInstance();
  }

  static Future<bool?> PutData({bool? value, String? key}) async {
    return await sharedpreferences?.setBool(key!, value!);
  }

  static bool? getData({String? key}) {
    return sharedpreferences?.getBool(key!);
  }
}
