import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color green7005c = fromHex('#5c1db604');

  static Color black9007f = fromHex('#7f000000');

  static Color gray600 = fromHex('#7e7e7e');

  static Color black9004c = fromHex('#4c000000');

  static Color yellow900E5 = fromHex('#e5f39022');

  static Color gray400 = fromHex('#c4c4c4');

  static Color black900A2 = fromHex('#a2000000');

  static Color black9006c = fromHex('#6c000000');

  static Color redA70005 = fromHex('#05de1111');

  static Color green700 = fromHex('#1db604');

  static Color black9003f = fromHex('#3f000000');

  static Color gray300 = fromHex('#e6e6e6');

  static Color black90087 = fromHex('#87000000');

  static Color black90075 = fromHex('#75000000');

  static Color black900 = fromHex('#000000');

  static Color yellow700 = fromHex('#ffbc3a');

  static Color bluegray400 = fromHex('#888888');

  static Color yellow900 = fromHex('#f39022');

  static Color black90019 = fromHex('#19000000');

  static Color yellow9005c = fromHex('#5cf39022');

  static Color whiteA700 = fromHex('#ffffff');

  static Color deepOrangeA400 = fromHex('#ff5100');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
