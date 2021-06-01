import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import './components/transaction_form.dart';
import 'dart:math';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
        appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // Função para abrir o modal do textfields
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    // Transaction(
    //     id: 't1',
    //     title: 'Novo Tênis de Corrida',
    //     value: 310.76,
    //     date: DateTime.now()),
    // Transaction(
    //     id: 't2', title: 'Conta #01', value: 157.99, date: DateTime.now()),
    // Transaction(
    //     id: 't3', title: 'Conta #02', value: 99.89, date: DateTime.now()),
    // Transaction(
    //     id: 't4', title: 'Conta #03', value: 384.80, date: DateTime.now()),
    // Transaction(
    //     id: 't5', title: 'Conta #04', value: 578.45, date: DateTime.now()),
    // Transaction(
    //     id: 't6', title: 'Conta #05', value: 723.56, date: DateTime.now()),
    // Transaction(
    //     id: 't7', title: 'Conta #06', value: 1025.48, date: DateTime.now()),
    // Transaction(
    //     id: 't8', title: 'Conta #07', value: 456.22, date: DateTime.now()),
    // Transaction(
    //     id: 't9', title: 'Conta #08', value: 652.43, date: DateTime.now()),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTransaction);
    });
    // Fecha modal...Retirando ele da pilha
    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
        actions: [
          IconButton(
              onPressed: () => _openTransactionFormModal(context),
              icon: Icon(Icons.add))
        ], // Botão add no topo
      ),
      body: SingleChildScrollView(
        child: Column(
          // controla onde fica start/end
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('Grafico'),
                elevation: 10,
              ),
            ),
            TransactionList(_transactions),
            // TransactionUser()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _openTransactionFormModal(context),
          child: Icon(Icons.add)), // Botão add no flutuante
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
