

import 'package:flutter_structure/data/services/datebase_services.dart';
import 'package:flutter_structure/features/shop/models/detail_collect.dart';
import 'package:sqflite/sqlite_api.dart';

class DetailCollectDb{
  final tableName = 'detail_collect';

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
      "idDetailCollect" INTEGER NOT NULL,
      "idServiceCollect" INTEGER NOT NULL,
      "idCollect" INTEGER NOT NULL,
      "price" BIGINT NOT NULL,
      "content" TEXT NOT NULL,
      "date" TEXT NOT NULL,
      "time" TEXT NOT NULL,
      PRIMARY KEY("idDetailCollect" AUTOINCREMENT),
      FOREIGN KEY(idServiceCollect) REFERENCES service_collect(idServiceCollect),
      FOREIGN KEY(idCollect) REFERENCES collect_money(idCollect)
      );  """);
  }

  Future<int> create({required int idServiceCollect,required int idCollect, required BigInt price,  required String content,required String date,required String time}) async {
    final database = await DatabaseService().database;

    return await database.rawInsert(
      '''INSERT INTO $tableName (idServiceCollect,idCollect,price,content,date,time) VALUES (?,?,?,?,?,?)''',
      [idServiceCollect,idCollect,price,content,date,time],
    );
  }

  Future<List<DetailCollect>> fetchAll() async {
    final database = await DatabaseService().database;
    final detailCollect= await database.rawQuery('''SELECT * from $tableName''');
    return detailCollect.map((detail) => DetailCollect.fromSqfliteDatabase(detail)).toList();
  }

  Future<DetailCollect> fetchById(int idDetailCollect) async {
    final database = await DatabaseService().database;
    final detail = await database
        .rawQuery('''SELECT * from $tableName WHERE idDetailCollect = ?''', [idDetailCollect]);
    return DetailCollect.fromSqfliteDatabase(detail.first);
  }

  Future<int> update({required int idDetailCollect, int? idServiceCollect, int? idCollect,  BigInt? price,   String? content, String? date, String? time}) async {
    final database = await DatabaseService().database;
    return await database.update(tableName, {
      if(idServiceCollect != null) 'idServiceCollect' : idServiceCollect,
      if(idCollect != null) 'idCollect' : idCollect,
      if(price != null) 'price' : price,
      if(content != null) 'content' : content,
      if(date != null) 'date' : date,
      if(time != null) 'time' : time,

    },
        where: 'idDetailCollect = ?',
        whereArgs: [idDetailCollect],
        conflictAlgorithm: ConflictAlgorithm.rollback);
  }

  Future<void> delete(int idDetailCollect) async {
    final database = await DatabaseService().database;

    await database.rawDelete(
        '''DELETE FROM $tableName WHERE idDetailCollect = ?''',[idDetailCollect]
    );
  }
}