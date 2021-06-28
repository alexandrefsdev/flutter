// O repository tem o objetivo de abstrair e separar, sua fonte de dados do seus controladores, tendo assim, um ponto único de falha, ou seja, se um dia você vier a trocar a api ou base de dados do seu projeto, basta alterar seus arquivos providers, não sendo necessário nenhuma alteração no repository, pois ele só é responsável por chamar a função do provider, não havendo lógica nenhuma ali.
// Dessa forma, tiramos muita responsabilidade do nosso controller, ele não precisa saber de onde vem os dados, apenas consumi-los, outra vantagem é que o repository faz a nossa ligação Controller <-> Dados.


//Repositório responsável pela entidade post !!
//lembrando que cada entidade que persiste de alguma forma com o banco de dados, seja ela uma api ou sqlite
//deve possuir um repositório excluisivo
import 'package:getx_pattern_kauemurakami/data/providers/remote/my_api_client.dart';

class MyRepository {
  final MyApiClient apiClient;

  MyRepository({required this.apiClient}) : assert(apiClient != null);

  getAll() {
    return apiClient.getAll();
  }
}
