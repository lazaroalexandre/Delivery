import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;
  // Avoid self isntance
  ColorsApp._();
  static ColorsApp get instance {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0xff007D21);
  Color get secundary => const Color(0xffffab18);
  Color get black => const Color(0xff140e0e);
}

extension ColorAppExtension on BuildContext {
  ColorsApp get colors => ColorsApp.instance;
  
}
