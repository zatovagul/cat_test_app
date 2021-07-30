import 'package:cat_test_app/app/constants/app_colors.dart';
import 'package:cat_test_app/app/constants/app_sizes.dart';
import 'package:cat_test_app/app/data/cat_model.dart';
import 'package:cat_test_app/app/modules/home/main/controllers/main_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatItemWidget extends StatelessWidget {
  final List<CatModel> model;
  final MainController controller;
  const CatItemWidget({Key? key, required this.model,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.w1 * 12),
      child: Row(
        children: model.length==1 ? [getItem(model[0])] :
        [
          getItem(model[0]),SizedBox(width: AppSizes.w1 * 15,),
          getItem(model[1])
        ],
      ),
    );
  }

  getItem(CatModel model){
    print(MainController.findMainController.checked);
    print("OK");
    return Obx(()=>Expanded(
      child: ElevatedButton(
        onPressed: () {
          model.onPressed!();
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30), )
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            height: this.model.length==1 ? AppSizes.w1 * 224 : AppSizes.w1 * 158,
            width: double.infinity,
            child: Stack(
              children: [
                  SizedBox(width: double.infinity, height: double.infinity,
                      child: Image.network(model.imageUrl, fit: BoxFit.cover,)),
                  Positioned(
                    bottom: AppSizes.w1 * 10,
                    left: AppSizes.w1 * 10,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(AppSizes.w1 * 3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name: ${model.name}", style: TextStyle(fontSize: AppSizes.w1 * (model.big ? 20 : 15), color: CupertinoColors.white),),
                            Text("Age: ${model.age}",  style: TextStyle(fontSize: AppSizes.w1 * (model.big ? 20 : 15), color: CupertinoColors.white),)
                          ],
                        ),
                      ),
                    ),
                  ),
                if(controller.checked.value == model.id)
                Positioned(
                  bottom: AppSizes.w1 * (model.big ? 15 :10),
                  right: AppSizes.w1 * (model.big ? 15 :10),
                  child: Container(
                    width: AppSizes.w1 * (model.big ? 35 : 20),
                    height: AppSizes.w1 * (model.big ? 35 : 20),
                    decoration: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    padding: EdgeInsets.all(AppSizes.w1 * 3),
                    child: Center(
                      child: Icon(Icons.check, size: AppSizes.w1 * (model.big ? 25 : 13),),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
