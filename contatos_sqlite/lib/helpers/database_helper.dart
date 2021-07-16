import 'dart:io';

import 'package:contatos_sqlite/models/contato.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  // usada para definir as colunas da tabela
  String contatoTable = 'contato';
  String colId = 'id';
  String colNome = 'nome';
  String colEmail = 'email';
  String colImagem = 'imagem';

  // construtor nomeado para criar instância da classe
  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      // executado somente uma vez
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper!;
  }

  Future<Database?> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'contatos.db';

    var contatosDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return contatosDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $contatoTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colNome TEXT, $colEmail TEXT, $colImagem TEXT)');
  }

  // Incluir um objeto contato no banco de dados
  Future<int> insertContato(Contato contato) async {
    Database? db = await this.database;

    var resultado = await db!.insert(contatoTable, contato.toMap());
    return resultado; // Retorna o ID do objeto
  }

  Future<Contato?> getContato(int id) async {
    Database? db = await this.database;

    List<Map<String, dynamic>> maps = await db!.query(
      contatoTable,
      columns: [colId, colNome, colEmail, colImagem],
      where: "$colId = ?",
      whereArgs: [id],
    );

    if (maps.length > 0) {
      return Contato.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List<Contato>> getContatos() async {
    Database? db = await this.database;

    var resultado = await db!.query(contatoTable);

    List<Contato> lista = resultado.isNotEmpty
        ? resultado.map((cont) => Contato.fromMap(cont)).toList()
        : [];

    return lista;
  }

  Future<int> updateContato(Contato contato) async {
    var db = await this.database;

    var resultado = await db!.update(
      contatoTable,
      contato.toMap(),
      where: '$colId = ?',
      whereArgs: [contato.id],
    );

    return resultado;
  }

  Future<int> deleteContato(int id) async {
    var db = await this.database;

    var resultado = await db!.delete(
      contatoTable,
      where: '$colId = ?',
      whereArgs: [id],
    );

    return resultado;
  }

  Future<int?> getCount() async {
    var db = await this.database;

    List<Map<String, dynamic>> x =
        await db!.rawQuery('SELECT COUNT (*) from $contatoTable');
    int? resultado = Sqflite.firstIntValue(x);

    return resultado;
  }

  Future close() async {
    Database? db = await this.database;
    db!.close();
  }
}
