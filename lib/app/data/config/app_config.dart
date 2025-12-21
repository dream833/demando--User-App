// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final getBox = GetStorage();
var BASE_URL = "https://saptahikgyan.in/de/api/";
const String USER_ID = "user_id";
const String IS_USER_LOGGED_IN = "IS_USER_LOGGED_IN";
const String USER_TOKEN = "TOKEN";
const String USER_EMAIL = "user_email";
const String USER_PASSWORD = "password";
const String USER_LOGIN = "login_true";
const String HIDEBUYNOW = "buy_now";
const String USER_OTP = "MY OTP";
const String FORGOTFIELD = "forgot-feild-data";
const String CUSTOMER_CODE = "customer_code";
var isDebugMode = true.obs;

void SHOW_SNACKBAR({int? duration, String? message, bool? isSuccess}) {
  Fluttertoast.showToast(
    msg: message ?? "No Message",
    toastLength: (duration != null && duration > 2500)
        ? Toast.LENGTH_LONG
        : Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: (isSuccess ?? true) ? Colors.green : Colors.red,
    textColor: Colors.white,
    fontSize: 14,
  );
}
