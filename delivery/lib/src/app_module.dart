import 'package:flutter_modular/flutter_modular.dart';
import './modules/home/home_page.dart';
import 'modules/login/login_modular.dart';


class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/login', module: LoginModular()),
    ChildRoute('/', child: (context, args) => const HomePage()),
  ];
}