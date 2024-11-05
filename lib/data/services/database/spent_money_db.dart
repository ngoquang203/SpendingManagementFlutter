

import 'package:flutter_structure/data/services/datebase_services.dart';
import 'package:flutter_structure/features/shop/models/spent_money.dart';
import 'package:sqflite/sqlite_api.dart';

class SpentMoneyDb{
  final tableName = 'spent_money';

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
      "idSpentMoney" INTEGER NOT NULL,
      "idUser" INTEGER NOT NULL,
      "sumSpent" BIGINT NOT NULL,
      PRIMARY KEY("idSpentMoney" AUTOINCREMENT),
      FOREIGN KEY(idUser) REFERENCES users(idUser)
      );  """);
  }

  Future<int> create({required int idUser,required BigInt sumSpent}) async {
    final database = await DatabaseService().database;

    return await database.rawInsert(
      '''INSERT INTO $tableName (inUser,sumSpent) VALUES (?,?)''',
      [idUser,sumSpent],
    );
  }

  Future<List<SpentMoney>> fetchAll() async {
    final database = await DatabaseService().database;
    final spentMoneys = await database.rawQuery('''SELECT * from $tableName''');
    return spentMoneys.map((spentMoney) => SpentMoney.fromSQfliteDatabase(spentMoney)).toList();
  }

  Future<SpentMoney> fetchById(int idSpentMoney) async {
    final database = await DatabaseService().database;
    final spentMoney = await database
        .rawQuery('''SELECT * from $tableName WHERE idSpentMoney = ?''', [idSpentMoney]);
    return SpentMoney.fromSQfliteDatabase(spentMoney.first);
  }

  Future<int> update({required int idSpentMoney,int? idUser,BigInt? sumSpent}) async {
    final database = await DatabaseService().database;
    return await database.update(tableName, {
      if(idUser != null) 'idUser' : idUser,
      if(sumSpent != null) 'sumSpent' : sumSpent,

    },
        where: 'idSpentMoney = ?',
        whereArgs: [idSpentMoney],
        conflictAlgorithm: ConflictAlgorithm.rollback);
  }

  Future<void> delete(int idSpentMoney) async {
    final database = await DatabaseService().database;

    await database.rawDelete(
        '''DELETE FROM $tableName WHERE idSpentMoney = ?''',[idSpentMoney]
    );
  }
}