import 'package:flutter/material.dart';

class CommonTextStyles {
  static TextStyle _createStyle(
      double? fontSize,
      Color? fontColor,
      FontWeight fontWeight,
      FontStyle fontStyle,
      ) {
    return TextStyle(
      fontFamily: "SpotifyMix",
      color: fontColor ?? Colors.white,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }

  static TextStyle thin(double? fontSize, Color? fontColor) {
    return _createStyle(fontSize, fontColor, FontWeight.w100, FontStyle.normal);
  }

  static TextStyle thinItalic(double? fontSize, Color? fontColor) {
    return _createStyle(fontSize, fontColor, FontWeight.w100, FontStyle.italic);
  }

  static TextStyle light(double? fontSize, Color? fontColor) {
    return _createStyle(fontSize, fontColor, FontWeight.w300, FontStyle.normal);
  }

  static TextStyle lightItalic(double? fontSize, Color? fontColor) {
    return _createStyle(fontSize, fontColor, FontWeight.w300, FontStyle.italic);
  }

  static TextStyle regular(double? fontSize, Color? fontColor) {
    return _createStyle(fontSize, fontColor, FontWeight.w400, FontStyle.normal);
  }

  static TextStyle regularItalic(double? fontSize, Color? fontColor) {
    return _createStyle(fontSize, fontColor, FontWeight.w400, FontStyle.italic);
  }

  static TextStyle medium(double? fontSize, Color? fontColor) {
    return _createStyle(fontSize, fontColor, FontWeight.w500, FontStyle.normal);
  }

  static TextStyle mediumItalic(double? fontSize, Color? fontColor) {
    return _createStyle(fontSize, fontColor, FontWeight.w500, FontStyle.italic);
  }

  static TextStyle bold(double? fontSize, Color? fontColor) {
    return _createStyle(fontSize, fontColor, FontWeight.w700, FontStyle.normal);
  }

  static TextStyle boldItalic(double? fontSize, Color? fontColor) {
    return _createStyle(fontSize, fontColor, FontWeight.w700, FontStyle.italic);
  }

  static TextStyle extrabold(double? fontSize, Color? fontColor) {
    return _createStyle(fontSize, fontColor, FontWeight.w800, FontStyle.normal);
  }

  static TextStyle extraboldItalic(double? fontSize, Color? fontColor) {
    return _createStyle(fontSize, fontColor, FontWeight.w800, FontStyle.italic);
  }

  static TextStyle black(double? fontSize, Color? fontColor) {
    return _createStyle(fontSize, fontColor, FontWeight.w900, FontStyle.normal);
  }

  static TextStyle blackItalic(double? fontSize, Color? fontColor) {
    return _createStyle(fontSize, fontColor, FontWeight.w900, FontStyle.italic);
  }

  static TextStyle ultra(double? fontSize, Color? fontColor) {
    return _createStyle(fontSize, fontColor, FontWeight.w900, FontStyle.normal);
  }

  static TextStyle ultraItalic(double? fontSize, Color? fontColor) {
    return _createStyle(fontSize, fontColor, FontWeight.w900, FontStyle.italic);
  }
}