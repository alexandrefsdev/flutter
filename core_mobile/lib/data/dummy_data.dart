import 'dart:math';

import 'package:core_mobile/models/branch.dart';
import 'package:core_mobile/models/project.dart';
import 'package:core_mobile/models/task.dart';

final DUMMY_PROJECTS = [
  Project(
    id: Random().nextInt(10000),
    code: 'PROJ - 9012052',
    name: 'PROJ - 9012052',
    branch: Branch(
      id: Random().nextInt(10000),
      name: 'Salvador',
    ),
    tasks: [
      Task(
        id: Random().nextInt(10000),
        description:
            'Reabertura e fechamento de caixa terminal ou caixa de emenda óptica existente em caixa subterrânea',
        plannedQuantity: 1,
        executedQuantity: 0,
      ),
      Task(
        id: Random().nextInt(10000),
        description: 'Instalar cabo de FO em duto ou subdoto (OCUPADO)',
        plannedQuantity: 780,
        executedQuantity: 0,
      ),
      Task(
        id: Random().nextInt(10000),
        description: 'Instalar cabo de FO em duto ou subdoto (OCUPADO)',
        plannedQuantity: 780,
        executedQuantity: 0,
      ),
      Task(
        id: Random().nextInt(10000),
        description: 'Instalação de sobra técnica de cabo de FO no subterrêneo',
        plannedQuantity: 20.0,
        executedQuantity: 0,
      ),
    ],
  ),
  Project(
    id: Random().nextInt(10000),
    code: 'BACOF02 ',
    name: 'BACOF02 ',
    branch: Branch(
      id: Random().nextInt(10000),
      name: 'Salvador',
    ),
    tasks: [
      Task(
        id: Random().nextInt(10000),
        description:
            'EMENDA ÓPTICA P/ FUSÃO',
        plannedQuantity: 72,
        executedQuantity: 0,
      ),
      Task(
        id: Random().nextInt(10000),
        description: 'Fosc 100 B/ M Tubo Entrada Oval Tubo Plástico Tubo',
        plannedQuantity: 14,
        executedQuantity: 0,
      ),
      Task(
        id: Random().nextInt(10000),
        description: 'ACEITAÇÃO/TESTES HOMOLOGAÇÃO CABOS ÓPTICOS (RELATÓRIOS)',
        plannedQuantity: 36,
        executedQuantity: 0,
      ),
    ],
  ),
];
