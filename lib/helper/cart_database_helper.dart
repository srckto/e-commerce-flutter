import 'package:e_commerce/constant.dart';
import 'package:e_commerce/models/cart_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._privateConstructor();

  static final CartDatabaseHelper instance = CartDatabaseHelper._privateConstructor();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    String path = await join(await getDatabasesPath() + "cart.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          '''
        CREATE TABLE $k_tableCart (
          $k_columnid TEXT NOT NULL,
          $k_columnTitle TEXT NOT NULL,
          $k_columnImage TEXT NOT NULL,
          $k_columnPrice INTEGER NOT NULL,
          $k_columnQuantity INTEGER NOT NULL)
        ''',
        );
      },
    );
  }

  Future<void> insert(CartModel model) async {
    await _database!.insert(
      k_tableCart,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, Object?>>?> getAllProduct() async {
    return await _database!.query(k_tableCart);
  }

  Future<void> update(CartModel model) async {
    await _database!.update(
      k_tableCart,
      model.toMap(),
      where: "$k_columnid = ?",
      whereArgs: [model.id],
    );
  }

  Future<void> delete(CartModel model) async {
    await _database!.delete(
      k_tableCart,
      where: "$k_columnid = ?",
      whereArgs: [model.id],
    );
  }

  Future<void> deleteTable(String tableName) async {
    await _database!.delete(tableName);
  }
}
