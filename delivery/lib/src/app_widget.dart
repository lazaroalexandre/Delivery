import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/global/gobal_context.dart';
import 'core/ui/theme/theme_config.dart';


class AppWidget extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>;
  AppWidget({super.key}) {
    GobalContext.instance.navigatorKey = _navigatorKey as GlobalKey<NavigatorState>;
  }

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/login');
    Modular.setNavigatorKey(_navigatorKey as GlobalKey<NavigatorState>?);
    return MaterialApp.router(
      title: 'Application Name',
      theme: ThemeConfig.theme,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
