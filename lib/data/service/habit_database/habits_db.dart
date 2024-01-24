// ignore_for_file: avoid_print

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class HabitDB {
  ///this getter to ensure that one data base instanse is created
  ///because we will call the same instance in any CRUD operation
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initializeDataBase();
      return _db;
    }
    return _db;
  }

  Future<Database> initializeDataBase() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'habits_record.db');

    /// join method merges db path with it's name
    Database historyDB = await openDatabase(
      dbPath,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
    return historyDB;
  }

  String habitTable = 'habits';
  String datesTable = 'trackingdates';

  /// create data base tables
  /// this method called once when data base is initialized
  _onCreate(Database db, int version) async {
    /// we added ''' at firsr and end of the sql order to enable multilines writing for sql code
    ///execute method takes Sql code (has it's own syntax)

    Batch dbBatch = db.batch();
    dbBatch.execute('''
  CREATE TABLE "$habitTable"(
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "habitName" TEXT NOT NULL
  )
''');

    dbBatch.execute('''
  CREATE TABLE "$datesTable"(
    "id" INTEGER NOT NULL,
    "date" TEXT NOT NULL,
    "done" INTEGER NOT NULL
  )
''');
    await dbBatch.commit();
    print('_oncreate function called to created data base table===========');
  }

  ///called when there is an update on the data base tables(Structure)
  _onUpgrade(Database db, int newVersion, int oldVersion) async {
    print(
        'onUpdate ========== function called to update data base table===========');
  }

  ///=================================
  ///========CRUD operations==========
  ///=================================

  ///Create
  Future<int> createData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    print('**************************************Create sql::: $response');
    return response;
  }

  ///Read
  Future<List<Map<String, dynamic>>> readData(String sql) async {
    Database? mydb = await db;
    List<Map<String, dynamic>> response = await mydb!.rawQuery(sql);
    print(
        '******************************************response from db:: $response');
    return response;
  }

  ///Update
  Future<int> updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    print('updste db:::: ress: $response');
    return response;
  }

  ///Delete
  Future<int> deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    print('Delete response $response');
    return response;
  }

  ///Delete the whole data base
  deleteCompleteDatabase() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'habits_record.db');
    await deleteDatabase(dbPath);
  }

  ///=================================
  ///=========Query proccess==========
  ///=================================

  Future<int> getLastInserRowId() async {
    Database? mydb = await db;
    int lastId = await mydb!
        .rawQuery('SELECT last_insert_rowid();')
        .then((result) => result.first.values.first as int);
    return lastId;
  }
}
