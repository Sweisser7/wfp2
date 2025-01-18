import 'package:floor/floor.dart';
import 'package:wfp2/persistence/user_entity.dart';

@dao
abstract class DAO {

  @Query('SELECT * FROM UserEntity')
  Future<List<UserEntity>> findAll();

  @insert
  Future<int> insertItem(UserEntity item);

  @delete
  Future<int> deleteItem(UserEntity item);

}