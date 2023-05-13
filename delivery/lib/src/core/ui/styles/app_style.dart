import 'package:flutter/material.dart';

import 'app_text_style.dart';
import 'colors_app.dart';

class AppStyle {
  static AppStyle? _instance;
  // Avoid self isntance
  AppStyle._();
  static AppStyle get instance {
    _instance ??= AppStyle._();
    return _instance!;
  }

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        backgroundColor: ColorsApp.instance.primary,
        textStyle: AppTextStyle.instance.textButtonLabel
      );
}

extension AppStyleExtention on BuildContext {
  AppStyle get appStyles => AppStyle.instance;
}
