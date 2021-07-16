class Contato {
  int? id;
  String? nome;
  String? email;
  String? imagem;

  Contato({
    required this.id,
    required this.nome,
    required this.email,
    required this.imagem,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'nome': nome,
      'email': email,
      'imagem': imagem,
    };
    return map;
  }

  Contato.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nome = map['nome'];
    email = map['email'];
    imagem = map['imagem'];
  }

  @override
  String toString() {
    return "Contato => (id: $id, nome: $nome, email: $email, imagem: $imagem)";
  }
}
