
import 'package:flutter_structure/data/services/datebase_services.dart';
import 'package:flutter_structure/features/shop/models/service_spent.dart';
import 'package:sqflite/sqlite_api.dart';

class ServiceSpentDb{
  final tableName = 'service_spent';

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
      "idServiceSpent" INTEGER NOT NULL,
      "nameService" TEXT NOT NULL,
      "explain" TEXT NOT NULL,
      PRIMARY KEY("idServiceSpent" AUTOINCREMENT)
      );  """);
  }

  Future<int> create({required String nameService,required String explain}) async {
    final database = await DatabaseService().database;

    return await database.rawInsert(
      '''INSERT INTO $tableName (nameService,explain) VALUES (?,?)''',
      [nameService,explain],
    );
  }

  Future<List<ServiceSpent>> fetchAll() async {
    final database = await DatabaseService().database;
    final serviceSpent = await database.rawQuery('''SELECT * from $tableName''');
    return serviceSpent.map((service) => ServiceSpent.fromSQfliteDatabase(service)).toList();
  }

  Future<ServiceSpent> fetchById(int idServiceSpent) async {
    final database = await DatabaseService().database;
    final service = await database
        .rawQuery('''SELECT * from $tableName WHERE idServiceSpent = ?''', [idServiceSpent]);
    return ServiceSpent.fromSQfliteDatabase(service.first);
  }

  Future<int> update({required int idServiceSpent,String? nameService,String? explain}) async {
    final database = await DatabaseService().database;
    return await database.update(tableName, {
      if(nameService != null) 'nameService' : nameService,
      if(explain != null) 'explain' : explain,

    },
        where: 'idServiceSpent = ?',
        whereArgs: [idServiceSpent],
        conflictAlgorithm: ConflictAlgorithm.rollback);
  }

  Future<void> delete(int idServiceSpent) async {
    final database = await DatabaseService().database;

    await database.rawDelete(
        '''DELETE FROM $tableName WHERE idServiceSpent = ?''',[idServiceSpent]
    );
  }
}
