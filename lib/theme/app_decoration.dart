import 'package:flutter/material.dart';
import 'package:latin_food_app/color.dart';
import 'package:latin_food_app/utils/color_constant.dart';
import 'package:latin_food_app/utils/size_utils.dart';

class AppDecoration {
  static BoxDecoration get outlineBlack900191 => BoxDecoration(
        color: ColorConstant.whiteA700,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black90019,
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack90087 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.black90087,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get fillRedA70005 => BoxDecoration(
        color: ColorConstant.redA70005,
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );

  static BoxDecoration get outlineYellow900e5 => BoxDecoration(
        color: ColorConstant.redA70005,
        border: Border.all(
          color: colorPrincipal,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get red => BoxDecoration(
        color: ColorConstant.yellow9005c,
      );
  static BoxDecoration get outlineBlack9007f => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.black9007f,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get outlineBlack9004c => BoxDecoration(
        border: Border.all(
          color: ColorConstant.black9004c,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get fillYellow900e5 => BoxDecoration(
        color: ColorConstant.yellow900E5,
      );
  static BoxDecoration get outlineBlack9003f => BoxDecoration();
  static BoxDecoration get fillGray400 => BoxDecoration(
        color: ColorConstant.gray400,
      );
  static BoxDecoration get fillGray300 => BoxDecoration(
        color: ColorConstant.gray300,
      );
  static BoxDecoration get outlineBlack90019 => BoxDecoration(
        color: ColorConstant.whiteA700,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black90019,
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get txtFillGray400 => BoxDecoration(
        color: ColorConstant.gray400,
      );
}

class BorderRadiusStyle {
  static BorderRadius circleBorder52 = BorderRadius.circular(
    getHorizontalSize(
      52,
    ),
  );

  static BorderRadius roundedBorder2 = BorderRadius.circular(
    getHorizontalSize(
      2,
    ),
  );

  static BorderRadius customBorderTL10 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        10,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        10,
      ),
    ),
  );

  static BorderRadius roundedBorder20 = BorderRadius.circular(
    getHorizontalSize(
      20,
    ),
  );

  static BorderRadius circleBorder8 = BorderRadius.circular(
    getHorizontalSize(
      8,
    ),
  );

  static BorderRadius txtRoundedBorder12 = BorderRadius.circular(
    getHorizontalSize(
      12,
    ),
  );
}
