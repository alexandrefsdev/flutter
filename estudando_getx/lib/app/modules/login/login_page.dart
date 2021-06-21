import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) => Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (text) => _.onUsernameChanged(text),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Username",
                  ),
                ),
                TextField(
                  onChanged: (text) => _.onPasswordChanged(text),
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                ),
                TextButton(
                  onPressed: () => _.submit(),
                  child: Text('Entrar'),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.black,
                    onSurface: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
