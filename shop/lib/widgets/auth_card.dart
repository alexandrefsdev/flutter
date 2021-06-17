import 'package:flutter/material.dart';

enum AuthMode { Signup, Login }

class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  GlobalKey<FormState> _form = GlobalKey();
  bool _isLoading = false;
  AuthMode _authMode = AuthMode.Login;
  final _passwordController = TextEditingController();

  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  void _submit() {
    if (!_form.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    _form.currentState!.save();

    if (_authMode == AuthMode.Login) {
    } else {}

    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Container(
          height: _authMode == AuthMode.Login ? 310 : 370,
          width: deviceSize.width * 0.75,
          padding: EdgeInsets.all(16),
          child: Form(
            key: _form,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'E-mail'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Inform um e-mail válido!';
                    }
                    return null;
                  },
                  onSaved: (value) => _authData['email'] = value!,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Senha'),
                  controller: _passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 5) {
                      return 'Informe uma senha válida!';
                    }
                    return null;
                  },
                  onSaved: (value) => _authData['password'] = value!,
                ),
                if (_authMode == AuthMode.Signup)
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Confirmar Senha'),
                    obscureText: true,
                    validator: _authMode == AuthMode.Signup
                        ? (value) {
                            if (value != _passwordController.text) {
                              return 'Senha são diferentes!';
                            }
                            return null;
                          }
                        : null,
                    onSaved: (value) => _authData['password'] = value!,
                  ),
                SizedBox(
                  height: 20,
                ),
                Spacer(),
                if (_isLoading)
                  CircularProgressIndicator()
                else
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      primary: Theme.of(context).primaryColor,
                      textStyle: TextStyle(
                        color: Theme.of(context).primaryTextTheme.button!.color,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 8,
                      ),
                    ),
                    child: Text(
                        _authMode == AuthMode.Login ? 'ENTRAR' : 'REGISTRAR'),
                    onPressed: _submit,
                  ),
                TextButton(
                  onPressed: _switchAuthMode,
                  style: TextButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    "ALTERNAR P/ ${_authMode == AuthMode.Login ? 'REGISTRAR' : 'LOGIN'}",
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
