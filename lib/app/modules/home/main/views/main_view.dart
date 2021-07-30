import 'package:cat_test_app/app/constants/app_sizes.dart';
import 'package:cat_test_app/app/data/cat_model.dart';
import 'package:cat_test_app/app/widgets/cat_item_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return MainWidget();
  }
}
class MainWidget extends StatelessWidget {
  final controller = Get.put(MainController());
  MainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cats App'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: controller.logOut, icon: Icon(Icons.logout))
        ],
      ),
      body: Obx(() {
        List<List<CatModel>> list = [];
        bool lastBig = true;
        for(int i = 0;i<controller.models.length;i++){
          final model = controller.models[i];
          if(model.big) {list.add([model]);lastBig = true;}
          else
          if(lastBig) lastBig = false;
          else{lastBig = true;list.add([controller.models[i-1], model]);}
        }
        return ListView(
          controller: controller.scrollController,
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: AppSizes.w1 * 10,
            ),
            ...list.map((e) => Padding(
              padding: EdgeInsets.only(bottom: AppSizes.w1 * 15),
              child: CatItemWidget(model: e,controller: controller,),
            )),
            if (controller.isLoading.value)
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppSizes.w1 * 20),
                child: Center(child: CircularProgressIndicator()),
              )
          ],
        );
      }),
    );
  }
}

