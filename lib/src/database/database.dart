import "package:nspy_digital/src/database/nspy_dao.dart";
import "package:sqflite/sqflite.dart";
import "package:path/path.dart";

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), "nspy.db");
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(NSPYDao.mensagensTable);
    },
    version: 1,
  );
}
