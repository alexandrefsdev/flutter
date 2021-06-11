import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  String password = '';
  // var maskCpf = MaskTextInputFormatter(
  //     mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});
  // var maskCNPJ = MaskTextInputFormatter(
  //     mask: "##.###.###/####-##", filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 80,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 150,
                    height: 150,
                    // child: Image.network(
                    //     'http://core.r2ti.com.br/assets/logo-8254567cf15397e05487d0adad9f7c2ef7a7191dd533941d55fd8f4015e504b2.png'),
                    child: Image.asset('assets/images/logo.png')),
                SizedBox(height: 20),
                TextField(
                  onChanged: (text) {
                    username = text;
                  },
                  decoration: InputDecoration(
                      labelText: 'Usuário',
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(8.0),
                        ),
                      )),
                ),
                SizedBox(height: 20),
                TextField(
                  onChanged: (text) {
                    password = text;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(8.0),
                        ),
                      )),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    if (username == 'alexandrefs' && password == '123') {
                      print(username);
                      print('Correto');
                      // // Esse pushReplacement evita que quando seja feito o login, possa retornar a está tela retirando-a do breadcrumb
                      // Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute(builder: (context) => HomePage())
                      // );
                      // Passar para a tela pro nome de rota declarada no app_widget
                      Navigator.of(context).pushReplacementNamed('/home');
                    } else {
                      print('Login inválido');
                    }
                  },
                  child: Text('Entrar',style: TextStyle(fontSize: 15)),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(157,12,21, 1),
                  ),
                ),
                // ElevatedButton(
                //   child: Text('Entrar'),
                //   onPressed: () {
                //     if (username == 'alexandrefs' && password == '123') {
                //       print(username);
                //       print('Correto');
                //       // // Esse pushReplacement evita que quando seja feito o login, possa retornar a está tela
                //       // Navigator.of(context).pushReplacement(
                //       //   MaterialPageRoute(builder: (context) => HomePage())
                //       // );
                //       // Passar para a tela pro nome de rota declarada no app_widget
                //       Navigator.of(context).pushReplacementNamed('/home');
                //     } else {
                //       print('Login inválido');
                //     }
                //   },
                //   style: ElevatedButton.styleFrom(
                //       primary: Color.fromRGBO(157,12,21, 1),
                //       padding:
                //           EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                //       textStyle:
                //           TextStyle(fontSize: 30)),

                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
