import 'package:get/get.dart';

import 'package:cat_test_app/app/modules/home/bindings/home_binding.dart';
import 'package:cat_test_app/app/modules/home/login/bindings/login_binding.dart';
import 'package:cat_test_app/app/modules/home/login/views/login_view.dart';
import 'package:cat_test_app/app/modules/home/main/bindings/main_binding.dart';
import 'package:cat_test_app/app/modules/home/main/views/main_view.dart';
import 'package:cat_test_app/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.LOGIN,
          page: () => LoginView(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: _Paths.MAIN,
          page: () => MainView(),
          binding: MainBinding(),
        ),
      ],
    ),
  ];
}
