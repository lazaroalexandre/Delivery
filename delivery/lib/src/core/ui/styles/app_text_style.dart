import 'package:flutter/material.dart';

class AppTextStyle {
  static AppTextStyle? _instance;
  // Avoid self isntance
  
  AppTextStyle._();

  static AppTextStyle get instance {
    _instance ??= AppTextStyle._();
    return _instance!;
  }

  String get fontFamily => 'mplus1';

  
  TextStyle get textLight =>
      TextStyle(fontWeight: FontWeight.w300, fontFamily: fontFamily);

  TextStyle get textRgular =>
      TextStyle(fontWeight: FontWeight.normal, fontFamily: fontFamily);

  TextStyle get textMedium =>
      TextStyle(fontWeight: FontWeight.w500, fontFamily: fontFamily);

  TextStyle get textSemiBold =>
      TextStyle(fontWeight: FontWeight.w600, fontFamily: fontFamily);

  TextStyle get textBold =>
      TextStyle(fontWeight: FontWeight.bold, fontFamily: fontFamily);

  TextStyle get textExtraBold =>
      TextStyle(fontWeight: FontWeight.w800, fontFamily: fontFamily);

  TextStyle get textButtonLabel => textBold.copyWith(fontSize: 14);
   TextStyle get textTitleLabel => textExtraBold.copyWith(fontSize: 22);
}

extension AppTextStyleExtention on BuildContext {
  AppTextStyle get appTextStyles => AppTextStyle.instance;
}