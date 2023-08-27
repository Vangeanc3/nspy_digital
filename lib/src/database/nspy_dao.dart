import 'package:nspy_digital/src/database/database.dart';
import 'package:sqflite/sqflite.dart';

class NSPYDao {
  static const String mensagensTable = 'CREATE TABLE login('
      'nome TEXT,'
      'logado BOOLEAN)';

  Future<Map<String, dynamic>> setarLogado() async {
    final Database db = await getDatabase();

    var idLogado = await db.insert('login', {'nome': 'token', 'logado': true});

    print(idLogado);
    var resultado = await db.query('login',
        where: 'nome = ?', whereArgs: ['token'], limit: 1);

    print(resultado.first);
    print(resultado.first["id"]);

    if (resultado.isNotEmpty) {
      return resultado.first;
    } else {
      throw Exception;
    }
  }

  Future<Map<String, dynamic>> retornaLogado() async {
    final Database db = await getDatabase();
    final resultado = await db.query('login',
        where: 'nome = ?', whereArgs: ['token'], limit: 1);

    if (resultado.isNotEmpty) {
      return resultado.first;
    } else {
      return {"logado": 0};
    }
  }
}
