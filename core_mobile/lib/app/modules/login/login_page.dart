import 'package:core_mobile/app/routes/app_pages.dart';
import 'package:core_mobile/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            color: Color.fromRGBO(131, 45, 45, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Column(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        child: Image.network(
                            'http://core.r2ti.com.br/assets/logo-8254567cf15397e05487d0adad9f7c2ef7a7191dd533941d55fd8f4015e504b2.png'),
                      ),
                      //child: Image.asset('assets/images/logo.png')),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: TextField(
                          onChanged: (text) => _.onUsernameChanged(text),
                          keyboardType: TextInputType.text,
                          // style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Usuário',
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: TextField(
                          onChanged: (text) => _.onPasswordChanged(text),
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Container(
                        width: double.infinity,
                        height: 50,
                        padding: EdgeInsets.all(10),
                        child: ElevatedButton.icon(
                          onPressed: () => Get.offNamed(AppRoutes.TABS),
                          label: Text('Entrar',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromRGBO(157, 12, 21, 0.7))),
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(254, 204, 0, 0.7),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                          ),
                          icon: Icon(
                            Icons.gps_fixed,
                            color: Color.fromRGBO(157, 12, 21, 0.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
