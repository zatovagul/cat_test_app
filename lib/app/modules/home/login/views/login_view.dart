import 'package:cat_test_app/app/constants/app_sizes.dart';
import 'package:cat_test_app/app/widgets/login_textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.w1 * 42),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LoginTextField(hintText: "Login",controller: controller.loginController,),
              SizedBox(height: AppSizes.w1 * 20,),
              LoginTextField(hintText: "Password",obscureText: true,controller:controller.passwordController),
              SizedBox(height: AppSizes.w1 * 35,),
              ElevatedButton(
                  onPressed: controller.postData,
                  style: ElevatedButton.styleFrom(padding: EdgeInsets.zero,
                      primary: Colors.green, 
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45))),
                  child: Container(
                    height: AppSizes.w1 * 50,
                    width: double.infinity,
                    child: Center(child:
                      Text("Sign In", style: TextStyle(fontSize: AppSizes.w1 * 16),)
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
