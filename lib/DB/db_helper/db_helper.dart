
import 'package:flutter_calorie_app/utils/library.dart';
import '../models/user_data_model.dart';
import 'constants.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._init();

  static Database? _database;

  DBHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('userDB.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = '$dbPath/$filePath';
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  /// Create DB
  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const boolType = 'BOOLEAN NOT NULL';
    const intType = 'INTEGER NOT NULL';
    const doubleType = 'REAL NOT NULL';
    const textType = 'TEXT NOT NULL';

    /// Create user data starting table
    await db.execute('''
    CREATE TABLE $tableUserDataStart (
    ${UserDataModelFields.columnId} $idType,
    ${UserDataModelFields.columnIsMale} $boolType,
    ${UserDataModelFields.columnHeight} $intType,
    ${UserDataModelFields.columnWeight} $doubleType,
    ${UserDataModelFields.columnAge} $intType,
    ${UserDataModelFields.columnCreatedDate} $textType
    )
    ''');

    /// Create user data table
    await db.execute('''
    CREATE TABLE $tableUserData (
    ${UserDataModelFields.columnId} $idType,
    ${UserDataModelFields.columnIsMale} $boolType,
    ${UserDataModelFields.columnHeight} $intType,
    ${UserDataModelFields.columnWeight} $doubleType,
    ${UserDataModelFields.columnAge} $intType,
    ${UserDataModelFields.columnCreatedDate} $textType
    )
    ''');
  }

  /// Create user start data
  Future<UserDataModel> createUserStartData(UserDataModel userData) async {
    final db = await instance.database;
    final id = await db.insert(tableUserDataStart, userData.toMap());
    return userData.copy(id: id);
  }

  /// Read user start data
  Future<UserDataModel> readUserDataStart(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableUserDataStart,
      columns: UserDataModelFields.values,
      where: '${UserDataModelFields.columnId} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return UserDataModel.fromMap(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  /// Get all user start data
  Future<List<UserDataModel>> readAllUserStartData() async {
    final db = await instance.database;

    final results = await db.query(tableUserDataStart);

    return results.map((map) => UserDataModel.fromMap(map)).toList();
  }

  /// Update user start data
  Future<int> updateUserStartData(UserDataModel userData) async {
    final db = await instance.database;

    return db.update(tableUserDataStart, userData.toMap(),
        where: '${UserDataModelFields.columnId} = ?', whereArgs: [userData.id]);
  }

  /// Delete user start data
  Future<int> deleteUserStartData(int id) async {
    final db = await instance.database;

    return await db.delete(tableUserDataStart,
        where: '${UserDataModelFields.columnId} = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

// class DBHelper {
//   // static Database? db;
//   //
//   // Future<Database> get database async => db ??= await openDB();
//
//   Future<Database> openDB() async {
//     var databasesPath = await getDatabasesPath();
//     String path = '${databasesPath}/userDB.db';
//     final database = await openDatabase(path, version: 1,
//         onCreate: (Database db, int version) async {
//       await db.execute('''
// create table $tableUserDataStart (
//   $columnId integer primary key autoincrement,
//   $columnTitle text not null,
//   $columnIsMale boolean not null,
//   $columnAge integer not null,
//   $columnHeight integer not null,
//   $columnWeight float not null
//   )
// ''');
//     });
//     print('__________DB open in: $path');
//     return database;
//   }
//
//   Future<void> insertUserDataStart(UserDataModel userDataModel) async {
//     final db = await openDB();
//     await db.insert(tableUserDataStart, userDataModel.toMap());
//     print('_________Insert userData: ${userDataModel.title}');
//   }
//
//   Future<UserDataModel?> getUserDataStart(int id) async {
//     final db = await openDB();
//     List<Map> maps = await db.query(tableUserDataStart,
//         columns: [
//           columnId,
//           columnIsMale,
//           columnTitle,
//           columnAge,
//           columnHeight,
//           columnWeight
//         ],
//         where: '$columnId = ?',
//         whereArgs: [id]);
//     if (maps.isNotEmpty) {
//       return UserDataModel.fromMap(maps.first as Map<String, Object?>);
//     }
//     return null;
//   }
//
//   // Future<int> delete(int id) async {
//   //   return await db.delete(tableTodo, where: '$columnId = ?', whereArgs: [id]);
//   // }
//   //
//   Future<void> updateUserDataStart(UserDataModel userDataModel) async {
//     final db = await openDB();
//     await db.update(tableUserDataStart, userDataModel.toMap(),
//         where: '$columnId = ?', whereArgs: [1]);
//   }
//
//   Future close() async {
//     final db = await openDB();
//     db.close();}
//
//   Future deleteTable(String table) async {
//     final db = await openDB();
//     db.delete(table);
//     print('_______Delete table: $table');
//   }
// }
