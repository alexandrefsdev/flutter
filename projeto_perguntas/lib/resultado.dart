import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function(String) quandoreiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoreiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns!';
    } else if (pontuacao < 12) {
      return 'Você é bom!';
    } else if (pontuacao < 16) {
      return 'Você é bom!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(fraseResultado, style: TextStyle(fontSize: 28)),
        ),
        TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(16.0),
              primary: Colors.blue,
              textStyle: const TextStyle(fontSize: 20),
            ),
            child: Text('Reiniciar?'),
            onPressed: () => quandoreiniciarQuestionario('Legal!!'),
            ),
      ],
    );
  }
}
