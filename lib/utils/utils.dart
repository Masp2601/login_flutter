import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latin_food_app/color.dart';

class UI {
  static Widget getTextfield({
    required String title,
    Widget? icon,
    Widget? icon2,
    String? initialValue,
    Color? backgroundColor,
    Function(String)? onChanged,
    bool obscureText = false,
    bool multiline = false,
    TextStyle? style,
    TextCapitalization capitalization = TextCapitalization.none,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    Function()? onTap,
  }) {
    TextEditingController _controller = TextEditingController();

    if (initialValue != null) {
      _controller.text = initialValue;
      _controller.selection =
          TextSelection.collapsed(offset: _controller.text.length);
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: SizedBox(
        height: multiline ? null : 50,
        child: CupertinoTextField(
          maxLines: multiline ? null : 1,
          minLines: multiline ? null : 1,
          controller: _controller,
          textAlignVertical:
              multiline ? TextAlignVertical.top : TextAlignVertical.center,
          obscureText: obscureText,
          onChanged: (value) {
            if (onChanged != null) {
              _controller.selection =
                  TextSelection.collapsed(offset: _controller.text.length);
              onChanged(value);
            }
          },
          expands: multiline,
          textCapitalization: capitalization,
          keyboardType: keyboardType,
          cursorColor: Colors.black26,
          inputFormatters: inputFormatters,
          padding: EdgeInsets.only(
            left: 14,
            top: multiline ? 12 : 0,
            right: multiline ? 12 : 0,
            bottom: multiline ? 12 : 0,
          ),
          placeholder: title,
          placeholderStyle: const TextStyle(
              fontFamily: "SanFrancisco",
              fontSize: 15,
              color: Color.fromRGBO(101, 96, 102, 1)),
          style: style,
          onTap: () {
            if (onTap != null) {
              onTap();
            }
          },
          prefix: icon2 != null
              ? Padding(padding: const EdgeInsets.only(left: 10), child: icon2)
              : const SizedBox(),
          suffix: icon != null
              ? Padding(padding: const EdgeInsets.all(15.0), child: icon)
              : const SizedBox(),
          decoration: BoxDecoration(
              color: backgroundColor ?? const Color.fromRGBO(242, 242, 242, 1),
              borderRadius: BorderRadius.circular(9)),
        ),
      ),
    );
  }

  static Widget getText(
      String texto,
      double size,
      Color? color,
      String? fontFamily,
      FontWeight? fontWeight,
      bool isTextEllipsis,
      bool isJustifyText) {
    return Text(
      texto,
      textAlign: isJustifyText ? TextAlign.justify : TextAlign.center,
      style: TextStyle(
          overflow: isTextEllipsis ? TextOverflow.ellipsis : null,
          letterSpacing: 0.5,
          fontFamily: fontFamily ?? "SanFrancisco",
          fontSize: size,
          fontWeight: fontWeight,
          color: color != null ? color : Colors.white),
    );
  }

  static AppBar getAppbar(String title, String? imageTitle,
      List<Widget> actions, Color color, Color colorLetra) {
    return AppBar(
      leadingWidth: 80,
      title: UI.getText(
          title, 18, colorLetra, null, FontWeight.w600, false, false),
      actions: actions,
      elevation: 1,
      backgroundColor: color,
    );
  }

  static getButton(
    String? title,
    double sizeTitle,
    double width,
    double height,
    Function() ontap,
  ) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromRGBO(243, 144, 34, 1),
                Color.fromRGBO(232, 64, 57, 1),
              ],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          height: height,
          width: width,
          child: title != null
              ? Center(
                  child: UI.getText(title, sizeTitle, null,
                      "SanFrancisco_Italic", FontWeight.w600, false, false))
              : Container()),
    );
  }

  static String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }

  static AppBar appBarUI(
      BuildContext context, String title, Color color, List<Widget> actions) {
    return AppBar(
        actions: actions,
        elevation: 0,
        leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: UI.getLeading(context, colorPrincipal)),
        backgroundColor: color,
        title: UI.getText(
            title, 20, Colors.black, null, FontWeight.w600, false, false));
  }

  static getLeading(BuildContext context, Color? color) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 50,
            width: 40,
            child: Icon(
              Icons.arrow_back_ios,
              size: 30,
              color: color ?? Colors.black,
            ),
          ),
        ),
        const Spacer()
      ],
    );
  }

  static String getIcons(String value) {
    var map = {
      "personBorder": "assets/VECTOR 05_MOCKUP 1(ICONO USUARIO).svg",
      "email": "assets/VECTOR 06_MOCKUP 1(ICONO CORREO).svg",
      "phone": "assets/VECTOR 07_MOCKUP 1(ICONO TELEFONO).svg",
      "location": "assets/VECTOR 08_MOCKUP 1(ICONO UBICACION).svg",
      "password":
          "assets/VECTOR 11_MOCKUP 1(ICONO CONFIRMACION CONTRASE„A REGISTRO).svg",
      "nameAgencia": "assets/VECTOR 0 MOKCUP 1 (NOMBRE AGENCIA).svg",
      "logoAnimate": "assets/logoAnimatedLatinFod.gif",
      "buscar": "assets/VECTOR 01 MOCKUP 2 (FILTRO DE BUSCADOR).svg",
      "salir_detail": "assets/ICONO.svg"
    };
    return map[value]!;
  }

  static Widget getIcon(String name, Color? color, double? size) {
    return SvgPicture.asset(
      UI.getIcons(name),
      color: color ?? colorPrincipal,
      width: size ?? 30,
    );
  }

  InputDecoration textInputDecoration(
    Widget? icon, [
    String lableText = "",
    String hintText = "",
  ]) {
    return InputDecoration(
      labelText: lableText,
      hintText: hintText,
      suffixIcon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: icon,
      ),
      fillColor: Colors.white,
      filled: true,
      labelStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontFamily: "SanFrancisco_Italic",
      ),
      contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: colorPrincipal, width: 3)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey, width: 2)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red, width: 2.0)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red, width: 2.0)),
    );
  }

  static getNombreAgencia() {
    return SizedBox(
      height: 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromRGBO(243, 144, 34, 1),
                    Color.fromRGBO(232, 64, 57, 1),
                  ],
                ),
              ),
              height: 25,
              width: 230,
              child: Center(
                  child: UI.getText("Diseñado por Masp2601", 14, null,
                      "SanFrancisco_Italic", FontWeight.w600, false, false))),
        ],
      ),
    );
  }
}
