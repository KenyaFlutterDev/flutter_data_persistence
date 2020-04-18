import 'package:flutterdatapersistence/models/User.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UserDao {
  Future<Database> getDatabase() async {
    // create the database
    final Future<Database> database =
        openDatabase(join(await getDatabasesPath(), 'mydatabase.db'),
            onCreate: (db, version) {
      return db.execute("""
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            email TEXT,
            password TEXT
          )
          """);
    }, version: 1);

    return database;
  }

  // insert user to db
  Future<void> insertUser(User user) async {
    // get db
    final Database db = await getDatabase();

    // insert query
    await db.insert('users', user.toMap());
  }

  // query the user by email
  Future<User> fetchUserByEmail(String email) async {
    // get db
    final Database db = await getDatabase();

    List<Map<String, dynamic>> response =
        await db.query('users', where: 'email = ?', whereArgs: [email]);

    return response.isNotEmpty ? User.fromMap(response.first) : null;
  }
}
