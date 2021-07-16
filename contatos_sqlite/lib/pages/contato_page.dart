import 'package:contatos_sqlite/models/contato.dart';
import 'package:flutter/material.dart';

class ContatoPage extends StatefulWidget {
  ContatoPage({this.contato});

  final Contato? contato;

  @override
  _ContatoPageState createState() => _ContatoPageState();
}

class _ContatoPageState extends State<ContatoPage> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _nomeFocus = FocusNode();

  bool editado = false;
  late Contato _editaContato;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.contato == null) {
      _editaContato = Contato(
        id: null,
        nome: '',
        email: '',
        imagem: null,
      );
    } else {
      _editaContato = Contato.fromMap(widget.contato!.toMap());
      _nomeController.text = _editaContato.nome!;
      _emailController.text = _editaContato.email!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_editaContato.nome == ''
            ? "Novo Contato"
            : _editaContato.nome.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_editaContato.nome != null && _editaContato.nome!.isNotEmpty) {
            Navigator.pop(context, _editaContato);
          } else {
            _exibeAviso();
            FocusScope.of(context).requestFocus(_nomeFocus);
          }
        },
        child: Icon(Icons.save),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            GestureDetector(
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: _editaContato.imagem != null
                        ? AssetImage('images/homem.png')
                        : AssetImage('images/homem.png'),
                  ),
                ),
              ),
            ),
            TextField(
              controller: _nomeController,
              focusNode: _nomeFocus,
              decoration: InputDecoration(labelText: "Nome"),
              onChanged: (text) {
                editado = true;
                setState(() {
                  _editaContato.nome = text;
                });
              },
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Email"),
              onChanged: (text) {
                editado = true;
                _editaContato.email = text;
              },
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
      ),
    );
  }

  void _exibeAviso() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('Nome'),
            content: Text('Informe o nome do contato'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Fechar'),
              ),
            ],
          );
        });
  }
}
