import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    try {
      controller.increment();
    }catch(err){print(err);}
    return Scaffold(
      backgroundColor: CupertinoColors.systemTeal,
      body: SizedBox(
        child: Text(""),
      ));
  }
}
