import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_crud/app/modules/login/store/login_store.dart';
import 'package:my_crud/app/widgets/custom_animated_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "MEU\nCRUD",
              style: TextStyle(
                fontSize: 55,
                fontWeight: FontWeight.bold,
                color: Colors.white70
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 60,),

            CustomAnimatedButton(
              onTap:  ()=> Modular.to.pushNamed("/login/singIn"),
              widhtMultiply: 1,
              height: 60,
              text: "Entrar",
              color: Color(0XFF338fa0),
            ),
            SizedBox(height: 20),

            CustomAnimatedButton(
              onTap:  ()=> Modular.to.pushNamed("/login/singUp"),
              widhtMultiply: 1,
              height: 60,
              text: "Cadastrar",
              color: Color(0xff7C83FD),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
