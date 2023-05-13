import 'package:flutter_modular/flutter_modular.dart';

import 'login_page.dart';

class LoginModular extends Module {

   @override
   List<Bind> get binds => [];

   @override
   List<ModularRoute> get routes => [
      ChildRoute('/', child: (context, args) => const LoginPage())
   ];

}