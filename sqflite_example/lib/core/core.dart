import 'package:sqflite/sqflite.dart';

class LocalDataBase {
  late Database db;

  Future open(String path) async {
//     db = await openDatabase(path, version: 1,
//         onCreate: (Database db, int version) async {
//       await db.execute('''
// create table $tableTodo ( 
//   $columnId integer primary key autoincrement, 
//   $columnTitle text not null,
//   $columnDone integer not null)
// ''');
//     });
  }

}
