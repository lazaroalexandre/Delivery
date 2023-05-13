import 'package:flutter/material.dart';

import '../../core/env/env.dart';
import '../../core/ui/helpers/loader.dart';
import '../../core/ui/helpers/messages.dart';
import '../../core/ui/helpers/size_extensions.dart';
import '../../core/ui/styles/app_style.dart';
import '../../core/ui/styles/app_text_style.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Loader, Messages {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
/*           Text(context.screenWidth.toString()),
          Text("Text Bold", style: context.appTextStyles.textBold,), */
          Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,

              child: TextFormField(
                decoration: const InputDecoration(label: Text('Login')),
                validator: (String) => 'Erro',
              ),
            ),
          ),
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(onPressed: () {
              
            }, child: Text("Clique aqui")),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showLoader();
          await Future.delayed(const Duration(seconds: 2));
          hideLoader();
          showError('Deu Erro!');
        },
      ),
    );
  }
}
