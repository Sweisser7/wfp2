import 'package:floor/floor.dart';

@entity
class UserEntity {

  @PrimaryKey(autoGenerate: true)
  int? id;

  final String username;
  final String password;

  UserEntity({
    this.id,
    required this.username,
    required this.password,
  });
}