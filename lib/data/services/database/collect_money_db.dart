

import 'package:flutter_structure/data/services/datebase_services.dart';
import 'package:flutter_structure/features/shop/models/collect_money.dart';
import 'package:sqflite/sqlite_api.dart';

class CollectMoneyDb{
  final tableName = 'collect_money';

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
      "idCollectMoney" INTEGER NOT NULL,
      "idUser" INTEGER NOT NULL,
      "sumCollect" BIGINT NOT NULL,
      PRIMARY KEY("idCollectMoney" AUTOINCREMENT),
      FOREIGN KEY(idUser) REFERENCES users(idUser)
      );  """);
  }

  Future<int> create({required int idUser,required BigInt sumCollect}) async {
    final database = await DatabaseService().database;

    return await database.rawInsert(
      '''INSERT INTO $tableName (inUser,sumCollect) VALUES (?,?)''',
      [idUser,sumCollect],
    );
  }

  Future<List<CollectMoney>> fetchAll() async {
    final database = await DatabaseService().database;
    final collectMoneys = await database.rawQuery('''SELECT * from $tableName''');
    return collectMoneys.map((collectMoney) => CollectMoney.fromSQfliteDatabase(collectMoney)).toList();
  }

  Future<CollectMoney> fetchById(int idCollectMoney) async {
    final database = await DatabaseService().database;
    final collectMoney = await database
        .rawQuery('''SELECT * from $tableName WHERE idCollectMoney = ?''', [idCollectMoney]);
    return CollectMoney.fromSQfliteDatabase(collectMoney.first);
  }

  Future<int> update({required int idCollectMoney,int? idUser,BigInt? sumCollect}) async {
    final database = await DatabaseService().database;
    return await database.update(tableName, {
      if(idUser != null) 'idUser' : idUser,
      if(sumCollect != null) 'sumCollect' : sumCollect,

    },
        where: 'idCollectMoney = ?',
        whereArgs: [idCollectMoney],
        conflictAlgorithm: ConflictAlgorithm.rollback);
  }

  Future<void> delete(int idCollectMoney) async {
    final database = await DatabaseService().database;

    await database.rawDelete(
        '''DELETE FROM $tableName WHERE idCollectMoney = ?''',[idCollectMoney]
    );
  }
}