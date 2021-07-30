import 'dart:convert';

import 'package:cat_test_app/app/constants/api.dart';
import 'package:cat_test_app/app/http.dart';
import 'package:cat_test_app/app/routes/app_pages.dart';
import 'package:cat_test_app/app/utils/storage_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoginController extends GetxController {
  TextEditingController loginController = TextEditingController(), passwordController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  postData()async{
    if(loginController.text.isEmpty || passwordController.text.isEmpty){
      Get.snackbar("Enter login information", loginController.text.isEmpty?"Enter Login":"Enter Password");
      return;
    }
    final url = pathBulderAPI("public/testAuth/");
    print(url);
    Get.context!.loaderOverlay.show();
    final a = await post(url, json.encode({
      "login":loginController.text,
      "password":passwordController.text
    }));
    print(a);
    Get.context!.loaderOverlay.hide();

    Map body = a['body'];
    if(a['statusCode']-200<100 && a['statusCode']-200>=0){
      StorageUtil.putString("token", body['accessToken']);
      Get.offAllNamed(Routes.MAIN);
    }
    else{
      if(body.containsKey("message"))
        Get.snackbar("Error", body['message']);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
