import 'package:flutter_calorie_app/DB/models/product_model.dart';
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

    /// Create product table
    await db.execute('''
    CREATE TABLE $tableProducts (
    ${ProductModelFields.columnId} $idType,
    ${ProductModelFields.columnLabel} $textType,
    ${ProductModelFields.columnCalories} $doubleType,
    ${ProductModelFields.columnProteins} $doubleType,
    ${ProductModelFields.columnFats} $doubleType,
    ${ProductModelFields.columnCarbohydrates} $doubleType,
    ${ProductModelFields.columnCreatedDate} $textType
    )
    ''');
  }

  /// USER DATA

  /// Create user data
  Future<UserDataModel> createUserData(
      String tableName, UserDataModel userData) async {
    final db = await instance.database;
    final id = await db.insert(tableName, userData.toMap());
    return userData.copy(id: id);
  }

  /// Read user data
  Future<UserDataModel?> readUserData(String tableName, int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableName,
      columns: UserDataModelFields.values,
      where: '${UserDataModelFields.columnId} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return UserDataModel.fromMap(maps.first);
    } else {
      return null;
    }
  }

  /// Get all user data
  Future<List<UserDataModel>> readAllUserData() async {
    final db = await instance.database;

    final results = await db.query(tableUserData);

    return results.map((map) => UserDataModel.fromMap(map)).toList();
  }

  /// Update user data
  Future<int> updateUserData(UserDataModel userData) async {
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

  /// Close DB
  Future close() async {
    final db = await instance.database;
    db.close();
  }

  /// PRODUCT DATA

  /// Create product data
  Future<ProductModel> createProductData(ProductModel productData) async {
    final db = await instance.database;
    final id = await db.insert(tableProducts, productData.toMap());
    return productData.copy(id: id);
  }

  /// Get all products data
  Future<List<ProductModel>> readAllProductData() async {
    final db = await instance.database;

    final results = await db.query(tableProducts);

    return results.map((map) => ProductModel.fromMap(map)).toList();
  }
}
