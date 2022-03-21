import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_zenn_api_freezed/data_sources/remote/user_remote_datasource.dart';
import 'package:flutter_zenn_api_freezed/models/user/user.dart';
import 'package:flutter_zenn_api_freezed/repositories/user_repository.dart';
import 'package:flutter_zenn_api_freezed/services/api/api_error.dart';
import 'package:flutter_zenn_api_freezed/services/api/api_service.dart';

final usersRepositoryProvider = Provider.autoDispose(
  (ref) => UserRepository(
    remoteRepository: UserRemoteDataSource(api: APIService.instance),
  ),
);

final usersViewModelProvider =
    StateNotifierProvider.autoDispose<UsersViewModel, AsyncValue<List<User>>>(
  (ref) => UsersViewModel(
    repository: ref.watch(usersRepositoryProvider),
  ),
);

class UsersViewModel extends StateNotifier<AsyncValue<List<User>>> {
  UsersViewModel({
    required this.repository,
  }) : super(const AsyncValue.loading()) {
    users();
  }

  final UserRepository repository;

  void users() async {
    state = const AsyncValue.loading();

    try {
      List<User> users = await repository.users();

      state = AsyncValue.data(users);
    } on APIError catch (e) {
      state = AsyncValue.error(e);
    }
  }
}
