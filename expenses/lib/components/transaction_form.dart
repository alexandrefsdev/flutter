import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit(title,
        value); // Forma de comunição da classe privada _TransactionFormState com o widget
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Título'),
              onSubmitted: (_) =>
                  _submitForm(), // Tenta submeter, mesmo sem clicar no botão
            ),
            TextField(
              controller: valueController,
              keyboardType: TextInputType.numberWithOptions(
                  decimal:
                      true), // Muda o teclado para numerico quando este teclado for selecionado
              decoration: InputDecoration(labelText: 'Valor (R\$)'),
              onSubmitted: (_) =>
                  _submitForm(), // Tenta submeter, mesmo sem clicar no botão
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                primary: Colors.purple,
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: Text('Nova Transação'),
              onPressed: _submitForm,
            ),
          ],
        ),
      ),
    );
  }
}
