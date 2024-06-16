import 'package:mongo_dart/mongo_dart.dart';

getConexao() async {
  var db = await Db.create('mongodb://localhost:27017/');
  await db.open();
  
  return db;
}
