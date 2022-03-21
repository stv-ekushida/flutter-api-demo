import 'package:flutter_zenn_api_freezed/data_sources/user_data_source.dart';
import 'package:flutter_zenn_api_freezed/models/user/user.dart';
import 'package:flutter_zenn_api_freezed/services/api/api_error.dart';
import 'package:flutter_zenn_api_freezed/services/api/api_service.dart';

class UserRemoteDataSource implements UserDataSource {
  final APIService api;

  const UserRemoteDataSource({
    required this.api,
  });

  @override
  Future<List<User>> users() async {
    try {
      final result = await api.get('/users');
      final List<User> users = [];

      for (Map<String, dynamic> user in result) {
        users.add(User.fromJson(user));
      }

      if (users.isEmpty) {
        throw const APIError.notFound();
      }

      return users;
    } on APIError catch (_) {
      rethrow;
    }
  }
}
