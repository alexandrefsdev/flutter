import 'package:flutter/material.dart';

void main() => runApp(Auth());

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' : (context) => LoginUi();
      },
    );
  }
}
