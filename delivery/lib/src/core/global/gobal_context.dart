import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../storage/storage.dart';

class GobalContext {
  late final GlobalKey<NavigatorState> _navigatorKey;

  static GobalContext? _instance;
  
  // Avoid self isntance
  GobalContext._();
  static GobalContext get instance {
    _instance ??= GobalContext._();
    return _instance!;
  }

  set navigatorKey(GlobalKey<NavigatorState> key) => _navigatorKey = key;

  void loginExpire(){
    Modular.get<Storage>().clean();
    ScaffoldMessenger.of(_navigatorKey.currentContext!).showSnackBar(SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.only(top: 72),
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(title: 'Login Expirado', message: 'O login exprirou! Faça login novamente.', contentType: ContentType.failure)
      
      ),);
      Modular.to.navigate('/login');
  }
}
