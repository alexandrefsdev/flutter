import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactions.isEmpty
          ? Column(
              children: [
                SizedBox(height: 20),
                Text('Nenhuma Transação Cadastrada!'),
                SizedBox(height: 20),
                Container(
                    height: 200,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover)),
              ],
            )
          : ListView.builder(
              // .builder evita carregamento desnecessario de todos os itens
              // Assim como o SingleChildScrollView, precisa de um pai(Container) com tamanho pre definido
              itemCount: transactions
                  .length, // Atributo do Listview para pegar o tamanho da lista
              itemBuilder: (ctx, index) {
                final tr = transactions[index];
                return Card(
                  child: Row(
                    children: [
                      // Container criado para dar estilo ao Text
                      Container(
                        margin:
                            // EdgeInsets.symetric para ser diferente nos eixos vertical/horizontal
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.purple.shade50, width: 2)),
                        // EdgeInsets.all para todas as dimensões
                        padding: EdgeInsets.all(10),
                        child: Text("R\$ ${tr.value.toStringAsFixed(2)}",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple[600])),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tr.title,
                            style: Theme.of(context).textTheme.headline6,
                            // style: TextStyle(
                            //     fontSize: 16, fontWeight: FontWeight.bold)
                          ),
                          Text(DateFormat('d MMM y').format(tr.date),
                              style: TextStyle(color: Colors.grey[400]))
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
