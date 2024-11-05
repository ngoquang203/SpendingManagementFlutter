

import 'package:flutter_structure/data/services/datebase_services.dart';
import 'package:flutter_structure/features/shop/models/user.dart';
import 'package:sqflite/sqflite.dart';

class UserDb{
  final tableName = 'users';

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
      "idUser" INTEGER NOT NULL,
      "name" TEXT NOT NULL,
      "sex" TEXT NOT NULL,
      "numberPhone" TEXT,
      "email" TEXT,
      PRIMARY KEY("idUser" AUTOINCREMENT)
      );  """);
  }

  Future<int> create({required String name,required String sex}) async {
    final database = await DatabaseService().database;

    return await database.rawInsert(
      '''INSERT INTO $tableName (name,sex) VALUES (?,?)''',
      [name, sex],
    );
  }

  Future<List<User>> fetchAll() async {
    final database = await DatabaseService().database;
    final users = await database.rawQuery('''SELECT * from $tableName''');
    return users.map((user) => User.fromSQfliteDatabase(user)).toList();
  }

  Future<User> fetchById(int idUser) async {
    final database = await DatabaseService().database;
    final user = await database
        .rawQuery('''SELECT * from $tableName WHERE idUser = ?''', [idUser]);
    return User.fromSQfliteDatabase(user.first);
  }

  Future<int> update({required int idUser,String? name,String? sex,String? numberPhone,String? email }) async {
    final database = await DatabaseService().database;
    return await database.update(tableName, {
      if(name != null) 'name' : name,
      if(sex != null) 'sex' : sex,
      if(numberPhone != null) 'numberPhone' : numberPhone,
      if(email != null) 'email' : email,
    },
        where: 'idUser = ?',
        whereArgs: [idUser],
        conflictAlgorithm: ConflictAlgorithm.rollback);
  }

  Future<void> delete(int idUser) async {
    final database = await DatabaseService().database;

    await database.rawDelete(
        '''DELETE FROM $tableName WHERE idUser = ?''',[idUser]
    );
  }
}