import 'package:flutter/material.dart';
import 'package:latin_food_app/theme/app_style.dart';
import 'package:latin_food_app/utils/color_constant.dart';

// ignore: must_be_immutable
class AppbarSubtitle1 extends StatelessWidget {
  AppbarSubtitle1({required this.text, this.margin, this.onTap});

  String text;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.txtPoppinsSemiBold14.copyWith(
            color: ColorConstant.black900,
          ),
        ),
      ),
    );
  }
}
