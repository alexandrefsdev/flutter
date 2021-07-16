import 'package:contatos_sqlite/helpers/database_helper.dart';
import 'package:contatos_sqlite/models/contato.dart';
import 'package:contatos_sqlite/pages/contato_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseHelper db = DatabaseHelper();

  List<Contato> contatos = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Contato c1 = Contato(
    //   id: 1,
    //   nome: "Maria",
    //   email: "maria@uol.comn.br",
    //   imagem: null,
    // );
    // // db.insertContato(c1);
    // Contato c2 = Contato(
    //   id: 2,
    //   nome: "João",
    //   email: "joao@uol.comn.br",
    //   imagem: null,
    // );
    // // db.insertContato(c2);

    // db.updateContato(c1);
    // db.updateContato(c2);

    _exibeTodosContatos();
  }

  _exibeTodosContatos() {
    db.getContatos().then((lista) {
      setState(() {
        contatos = lista;
      });

      print(lista);
    });
  }

  void _confirmaExclusao(BuildContext context, int contatoID, index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Excluir Contato"),
            content: Text("Confirma a exclusão do contato"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancelar"),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    contatos.removeAt(index);
                    db.deleteContato(contatoID);
                  });
                  Navigator.of(context).pop();
                },
                child: Text("Excluir"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agenda'),
        backgroundColor: Colors.indigo,
        centerTitle: true,
        actions: [],
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _exibeContatoPage();
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: contatos.length,
        itemBuilder: (context, index) {
          return _listaContatos(context, index);
        },
      ),
    );
  }

  _listaContatos(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        _exibeContatoPage(contato: contatos[index]);
        print("OLá");
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: contatos[index].imagem != null
                        ? AssetImage('images/homem.png')
                        : AssetImage('images/homem.png'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contatos[index].nome ?? "",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      contatos[index].email ?? "",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {
                    _confirmaExclusao(
                      context,
                      contatos[index].id!.toInt(),
                      index,
                    );
                  },
                  icon: Icon(Icons.delete))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _exibeContatoPage({Contato? contato}) async {
    final contatoRecebido = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ContatoPage(contato: contato),
      ),
    );
    if (contatoRecebido != null) {
      if (contato != null) {
        await db.updateContato(contatoRecebido);
      } else {
        await db.insertContato(contatoRecebido);
      }
      _exibeTodosContatos();
    }
  }
}
