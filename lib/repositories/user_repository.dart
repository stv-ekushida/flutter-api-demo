import 'package:flutter_zenn_api_freezed/data_sources/remote/user_remote_datasource.dart';
import 'package:flutter_zenn_api_freezed/models/user/user.dart';
import 'package:flutter_zenn_api_freezed/services/api/api_error.dart';

class UserRepository {
  final UserRemoteDataSource remoteRepository;

  const UserRepository({
    required this.remoteRepository,
  });

  Future<List<User>> users() async {
    try {
      return remoteRepository.users();
    } on APIError catch (_) {
      rethrow;
    }
  }
}
