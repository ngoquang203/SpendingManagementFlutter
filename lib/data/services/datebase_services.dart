import 'package:flutter_structure/data/services/database/todo_db.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';


class DatabaseService {
  static Database? _database;


  // name table
  final String user = "User";
  final String planMoney = "PlanMoney";
  final String spentMoney = "SpentMoney";
  final String collectMoney = "CollectMoney";
  final String detailSpent = "DetailSpent";
  final String detailCollect = "DetailCollect";
  final String serviceSpent = "ServiceSpent";
  final String serviceCollect = "ServiceCollect";

  // name colum in table User
  final String userIDUser = "IDuser";
  final String userNames = "Names";
  final String userSex = "Sex";
  final String userEmail = "Email";
  final String userNumberPhone = "NumberPhone";

  // name colum in PlanMoney
  final String planMoneyIDPlan = "IDplan";
  final String planMoneyIDUser = "IDuser";
  final String planMoneyNamePlanMoney = "NamePlanMoney";
  final String planMoneyIDService = "IDservice";
  final String planMoneySumMoney = "SumMoney";
  final String planMoneyDateStart = "DateStart";
  final String planMoneyDateEnd = "DateEnd";
  final String planMoneyContent = "Content";
  final String planMoneyMoneyNow = "MoneyNow";

  // name colum in SpentMoney
  final String spentMoneyIDSpent = "IDspent";
  final String spentMoneyIDUser = "IDuser";
  final String spentMoneySumSpent = "SumSpent";

  // name colum in CollectMoney
  final String collectMoneyIDCollect = "IDcollect";
  final String collectMoneyIDUser = "IDuser";
  final String collectMoneySumCollect = "SumCollect";

  // name colum in DetailSpent
  final String detailSpentIDDetailSpent = "IDdetailspent";
  final String detailSpentIDSpent = "IDspent";
  final String detailSpentIDServiceSpent = "IDservicespent";
  final String detailSpentNameService = "Nameservice";
  final String detailSpentPrice = "Price";
  final String detailSpentContent = "Content";
  final String detailSpentDates = "Dates";
  final String detailSpentTimes = "Times";
  final String detailSpentMoneyNow = "MoneyNow";

  // name colum in DetailCollect
  final String detailCollectIDDetailCollect = "IDdetailcollect";
  final String detailCollectIDServiceCollect = "IDservicecollect";
  final String detailCollectNameService = "Nameservice";
  final String detailCollectPrice = "Price";
  final String detailCollectContent = "Content";
  final String detailCollectDates = "Dates";
  final String detailCollectTimes = "Times";
  final String detailCollectMoneyNow = "MoneyNow";

  // name colum in ServiceSpent
  final String serviceSpentIDServiceSpent = "IDservicespent";
  final String serviceSpentNameService = "Nameservice";
  final String serviceSpentContent = "Content";

  // name colum in ServiceCollect
  final String serviceCollectIDServiceCollect = "IDservicecollect";
  final String serviceCollectNameService = "Nameservice";
  final String serviceCollectContent = "Content";



  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initialize();
    return _database!;
  }

  Future<Database> _initialize() async {
    final path = await fullPath;
    var database = await openDatabase(
      path, version: 1, onCreate: create, singleInstance: true,);
    return database;
  }

  Future<String> get fullPath async {
    const name = 'todo.db';
    final path = await getDatabasesPath();
    return join(path, name);
  }

  Future<void> create(Database database,int version) async => await TodoDb().createTable(database);

}
