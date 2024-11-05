
import 'package:flutter_structure/data/services/datebase_services.dart';
import 'package:flutter_structure/features/shop/models/service_collect.dart';
import 'package:sqflite/sqlite_api.dart';

class ServiceCollectDb{
  final tableName = 'service_collect';

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
      "idServiceCollect" INTEGER NOT NULL,
      "nameService" TEXT NOT NULL,
      "explain" TEXT NOT NULL,
      PRIMARY KEY("idServiceCollect" AUTOINCREMENT)
      );  """);
  }

  Future<int> create({required String nameService,required String explain}) async {
    final database = await DatabaseService().database;

    return await database.rawInsert(
      '''INSERT INTO $tableName (nameService,explain) VALUES (?,?)''',
      [nameService,explain],
    );
  }

  Future<List<ServiceCollect>> fetchAll() async {
    final database = await DatabaseService().database;
    final serviceCollect = await database.rawQuery('''SELECT * from $tableName''');
    return serviceCollect.map((service) => ServiceCollect.fromSQfliteDatabase(service)).toList();
  }

  Future<ServiceCollect> fetchById(int idServiceCollect) async {
    final database = await DatabaseService().database;
    final service = await database
        .rawQuery('''SELECT * from $tableName WHERE idServiceCollect = ?''', [idServiceCollect]);
    return ServiceCollect.fromSQfliteDatabase(service.first);
  }

  Future<int> update({required int idServiceCollect,String? nameService,String? explain}) async {
    final database = await DatabaseService().database;
    return await database.update(tableName, {
      if(nameService != null) 'nameService' : nameService,
      if(explain != null) 'explain' : explain,

    },
        where: 'idServiceCollect = ?',
        whereArgs: [idServiceCollect],
        conflictAlgorithm: ConflictAlgorithm.rollback);
  }

  Future<void> delete(int idServiceCollect) async {
    final database = await DatabaseService().database;

    await database.rawDelete(
        '''DELETE FROM $tableName WHERE idServiceCollect = ?''',[idServiceCollect]
    );
  }


}