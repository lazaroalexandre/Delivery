import 'package:flutter/material.dart';

import '../../core/ui/helpers/size_extensions.dart';
import '../../core/ui/styles/app_style.dart';
import '../../core/ui/styles/app_text_style.dart';
import '../../core/ui/styles/colors_app.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenShortesSide = context.screenShortestSide;
    final screenWidth = context.screenWidth;
    return Scaffold(
      backgroundColor: context.colors.black,
      body: Stack(
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
                  maxWidth: context.percentWidth(screenWidth < 1300 ? .7 : .3),
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
                        decoration: InputDecoration(labelText: 'E-mail'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Senha '),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(onPressed: () {
                          
                        }, child: Text('Entrar')),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
