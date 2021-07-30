import 'package:cat_test_app/app/constants/app_colors.dart';
import 'package:cat_test_app/app/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool? obscureText;
  const LoginTextField({Key? key, this.controller, this.hintText:'', this.obscureText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        height: AppSizes.w1 * 40,
        padding: EdgeInsets.symmetric(horizontal: AppSizes.w1 * 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.lightGrey
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: TextField(
            obscureText: obscureText??false,
            controller:controller,
            decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(fontSize: AppSizes.w1 * 16)
            ),
            style: TextStyle(fontSize: AppSizes.w1 * 16),
          ),
        ),
      ),
    );
  }
}
