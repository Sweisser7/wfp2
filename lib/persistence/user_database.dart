import 'dart:async';
import 'package:floor/floor.dart';
import 'package:wfp2/persistence/dao.dart';
import 'package:wfp2/persistence/user_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

//flutter packages pub run build_runner build
part 'user_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [UserEntity])
abstract class UserDatabase extends FloorDatabase {
  DAO get dao;
}