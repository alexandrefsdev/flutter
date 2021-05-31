import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
            children: transactions.map((tr) {
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
                        Text(tr.title,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(DateFormat('d MMM y').format(tr.date),
                            style: TextStyle(color: Colors.grey[400]))
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          );
  }
}
