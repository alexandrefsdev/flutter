import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flexible & Expanded',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Flexible & Expanded'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // O TAMANHO DO CONTAINER É O MINIMO NECESSARIO PARA QUE TODOS ELEMENTOS CAIBAM
          Container(
            height: 100,
            child: Text('Item 1 - pretty big!'),
            color: Colors.red,
          ),
          Expanded(
            // O EXPANDER É O FLEXIBLE JÁ SETADO PARA FlexFit.tight
            // FlexFit.tight -> EXPANDE OS ELEMENTOS PARA OCUPAR TODOS OS ESPAÇOS LIVRES DA LINHA
            // fit: FlexFit.tight,
            // flex -> CONTROLA QUEM TEM PRIORIDADE
            flex: 4,
            child: Container(
              height: 100,
              child: Text('Item 2'),
              color: Colors.blue,
            ),
          ),
          Flexible(
            // flex -> CONTROLA QUEM TEM PRIORIDADE
            flex: 1,
            // FlexFit.tight -> EXPANDE OS ELEMENTOS PARA OCUPAR TODOS OS ESPAÇOS LIVRES DA LINHA
            fit: FlexFit.loose,
            child: Container(
              height: 100,
              child: Text('Item 3'),
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
