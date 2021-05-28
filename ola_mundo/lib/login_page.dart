import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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

  Widget _body() {
    return ListView(
      children: [
        SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 60,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    child: Image.network(
                        'http://core.r2ti.com.br/assets/logo-8254567cf15397e05487d0adad9f7c2ef7a7191dd533941d55fd8f4015e504b2.png'),
                  ),
                  Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        // padding: const EdgeInsets.all(12.0),
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 12, top: 40, bottom: 12),
                        child: Column(children: [
                          TextField(
                            onChanged: (text) {
                              username = text;
                            },
                            decoration: InputDecoration(
                                labelText: 'Usuário',
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(20.0),
                                  ),
                                )),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            onChanged: (text) {
                              password = text;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                                labelText: 'Senha',
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(20.0),
                                  ),
                                )),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                if (username == 'afs' &&
                                    password == '123') {
                                  print(username);
                                  print('Correto');
                                  // // Esse pushReplacement evita que quando seja feito o login, possa retornar a está tela retirando-a do breadcrumb
                                  // Navigator.of(context).pushReplacement(
                                  //   MaterialPageRoute(builder: (context) => HomePage())
                                  // );
                                  // Passar para a tela pro nome de rota declarada no app_widget
                                  Navigator.of(context)
                                      .pushReplacementNamed('/home');
                                } else {
                                  print('Login inválido');
                                }
                              },
                              child: Text('Entrar',
                                  style: TextStyle(fontSize: 15)),
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(157, 12, 21, 1),
                              ),
                            ),
                          ),
                        ]),
                      )),
                  SizedBox(height: 15),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // Stack empilha
        body: Stack(
          children: [
            // Container(color: Colors.yellow),
            SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Image.asset('assets/images/background.jpg',
                    fit: BoxFit.cover)),
            Container(color: Colors.black.withOpacity(0.2)),
            _body(),
          ],
        ));
  }
}
