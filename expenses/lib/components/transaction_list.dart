import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../components/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    print('build() TransactionList');
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  'Nenhuma Transação Cadastrada!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 20),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            // .builder evita carregamento desnecessario de todos os itens
            // Assim como o SingleChildScrollView, precisa de um pai(Container) com tamanho pre definido
            itemCount: transactions
                .length, // Atributo do Listview para pegar o tamanho da lista
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return TransactionItem(
                key: GlobalObjectKey(tr), // Causa ineficiencia mas é a forma de resolver no caso do ListView.builder
                tr: tr,
                onRemove: onRemove,
              );
            },
          );
    //   ListView(
    //   children: transactions.map((tr) {
    //     return TransactionItem(
    //       key: ValueKey(tr.id), // Travando o contexto referente a chave local
    //       tr: tr,
    //       onRemove: onRemove,
    //     );
    //   }).toList(),
    // );
  }
}
