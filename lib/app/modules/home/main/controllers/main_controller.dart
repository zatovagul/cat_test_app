import 'dart:convert';

import 'package:cat_test_app/app/constants/api.dart';
import 'package:cat_test_app/app/data/cat_model.dart';
import 'package:cat_test_app/app/http.dart';
import 'package:cat_test_app/app/routes/app_pages.dart';
import 'package:cat_test_app/app/utils/storage_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  static final MainController findMainController = Get.find<MainController>();

  ScrollController scrollController = ScrollController();
  late String token;
  RxBool isLoading = true.obs;
  RxList<CatModel> models = RxList();
  RxInt checked = (-2).obs;
  
  int? nextPage = 0;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    token = StorageUtil.getString("token")!;
    getData();
    scrollController.addListener(() {
      if(scrollController.position.maxScrollExtent <= scrollController.position.maxScrollExtent){
        getData();
      }
    });
  }

  logOut(){
    StorageUtil.removeString("token");
    Get.offAllNamed(Routes.LOGIN);
  }
  getData() async{
    if(nextPage==null || (isLoading.value && models.length > 0))
      return;
    final url = pathBulderAPI("private/list", {'page':'$nextPage'});
    print(url);
    isLoading.value = true;
    final a = await get(url);
    isLoading.value = false;
    List<CatModel> list = [];
    for(dynamic i in a){
      final model = CatModel.fromJson(i);
      list.add(model);
      list.last.onPressed = (){
        checked.value = model.id;
      };
    }
    models.addAll(list);
    nextPage = nextPage!+1;
    if(a.length == 0)
      nextPage = null;

    if(nextPage==1)
      getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
