import 'package:flutter_zenn_api_freezed/models/user/user.dart';

abstract class UserDataSource {
  Future<List<User>> users();
}
