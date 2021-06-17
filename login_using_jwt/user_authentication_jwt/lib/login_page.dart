import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:user_authentication_jwt/main.dart';

class LoginPage extends StatelessWidget {
  void displayDialog(BuildContext context, String title, String text) =>
      showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );
  Future<String?> attemptLogIn(String username, String password) async {
    final Uri urlLogin = Uri.parse("$SERVER_IP/login");
    var res = await http
        .post(urlLogin, body: {"username": username, "password": password});
    if (res.statusCode == 200) return res.body;
    return null;
  }

  Future<int> attemptSignUp(String username, String password) async {
    final Uri urlSignUp = Uri.parse('$SERVER_IP/signup');
    var res = await http.post(urlSignUp,
        body: {"username": username, "password": password});
    return res.statusCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Container(),
    );
  }
}
