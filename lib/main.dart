import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'app/routes/app_pages.dart';
import 'app/utils/storage_util.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtil.getInstance();
  final token = StorageUtil.getString("token");
  runApp(
    GlobalLoaderOverlay(
      overlayOpacity: 0.3,
      overlayColor: Colors.black,
      child: GetMaterialApp(
        title: "Application",
        initialRoute: token==null ? Routes.LOGIN : Routes.MAIN,// AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    ),
  );
}
