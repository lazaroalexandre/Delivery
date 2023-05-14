import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:validatorless/validatorless.dart';

import '../../core/ui/helpers/loader.dart';
import '../../core/ui/helpers/messages.dart';
import '../../core/ui/helpers/size_extensions.dart';
import '../../core/ui/styles/app_style.dart';
import '../../core/ui/styles/app_text_style.dart';
import '../../core/ui/styles/colors_app.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with Loader, Messages {
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final controller = Modular.get<LoginController>();
  late final ReactionDisposer statusReactionDisposer;

  @override
  void initState() {
    statusReactionDisposer = reaction((_) => controller.loginStatus, (status) {
      switch (status) {
        case LoginStateStatus.initial:
          break;
        case LoginStateStatus.loading:
          showLoader();
          break;
        case LoginStateStatus.success:
          hideLoader();
          Modular.to.navigate('/');
          break;
        case LoginStateStatus.error:
          hideLoader();
          showError(controller.errorMessage ?? '');
          break;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    statusReactionDisposer();
    super.dispose();
  }

  void _formEnter() {
    final formValidate = formKey.currentState?.validate() ?? false;
    if (formValidate) {
      controller.login(
        emailEC.text,
        passwordEC.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenShortesSide = context.screenShortestSide;
    final screenWidth = context.screenWidth;
    return Scaffold(
      backgroundColor: context.colors.black,
      body: Form(
        key: formKey,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: screenShortesSide * .5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/lanche.png'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: context.percentWidth(.10)),
              width: screenShortesSide * .5,
              child: Image.asset('assets/images/logo.png'),
            ),
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth:
                        context.percentWidth(screenWidth < 1300 ? .7 : .3),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FractionallySizedBox(
                          widthFactor: .3,
                          child: Image.asset('assets/images/logo.png'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Login',
                            style: context.appTextStyles.textTitleLabel,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onFieldSubmitted: (value) => _formEnter(),
                          controller: emailEC,
                          decoration: InputDecoration(labelText: 'E-mail'),
                          validator: Validatorless.multiple([
                            Validatorless.required('E-mail Obrigatório!'),
                            Validatorless.email('E-mail inválido!')
                          ]),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onFieldSubmitted: (value) => _formEnter(),
                          controller: passwordEC,
                          decoration: InputDecoration(labelText: 'Senha '),
                          validator:
                              Validatorless.required('Senha Obrigatória!'),
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () => _formEnter(),
                              child: Text('Entrar')),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
