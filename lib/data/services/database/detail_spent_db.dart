
import 'package:flutter_structure/data/services/datebase_services.dart';
import 'package:flutter_structure/features/shop/models/detail_spent.dart';
import 'package:sqflite/sqlite_api.dart';

class DetailSpentDb{

  final tableName = 'detail_spent';

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
      "idDetailSpent" INTEGER NOT NULL,
      "idServiceSpent" INTEGER NOT NULL,
      "idSpent" INTEGER NOT NULL,
      "price" BIGINT NOT NULL,
      "content" TEXT NOT NULL,
      "date" TEXT NOT NULL,
      "time" TEXT NOT NULL,
      PRIMARY KEY("idDetailSpent" AUTOINCREMENT),
      FOREIGN KEY(idServiceSpent) REFERENCES service_spent(idServiceSpent),
      FOREIGN KEY(idSpent) REFERENCES spent_money(idSpent)
      );  """);
  }

  Future<int> create({required int idServiceSpent,required int idSpent, required BigInt price,  required String content,required String date,required String time}) async {
    final database = await DatabaseService().database;

    return await database.rawInsert(
      '''INSERT INTO $tableName (idServiceSpent,idSpent,price,content,date,time) VALUES (?,?,?,?,?,?)''',
      [idServiceSpent,idSpent,price,content,date,time],
    );
  }

  Future<List<DetailSpent>> fetchAll() async {
    final database = await DatabaseService().database;
    final detailSpent = await database.rawQuery('''SELECT * from $tableName''');
    return detailSpent.map((detail) => DetailSpent.fromSqfliteDatabase(detail)).toList();
  }

  Future<DetailSpent> fetchById(int idDetailSpent) async {
    final database = await DatabaseService().database;
    final detail = await database
        .rawQuery('''SELECT * from $tableName WHERE idDetailSpent = ?''', [idDetailSpent]);
    return DetailSpent.fromSqfliteDatabase(detail.first);
  }

  Future<int> update({required int idDetailSpent, int? idServiceSpent, int? idSpent,  BigInt? price,   String? content, String? date, String? time}) async {
    final database = await DatabaseService().database;
    return await database.update(tableName, {
      if(idServiceSpent != null) 'idServiceSpent' : idServiceSpent,
      if(idSpent != null) 'idSpent' : idSpent,
      if(price != null) 'price' : price,
      if(content != null) 'content' : content,
      if(date != null) 'date' : date,
      if(time != null) 'time' : time,

    },
        where: 'idDetailSpent = ?',
        whereArgs: [idDetailSpent],
        conflictAlgorithm: ConflictAlgorithm.rollback);
  }

  Future<void> delete(int idDetailSpent) async {
    final database = await DatabaseService().database;

    await database.rawDelete(
        '''DELETE FROM $tableName WHERE idDetailSpent = ?''',[idDetailSpent]
    );
  }
}