import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_zenn_api_freezed/components/empty_view.dart';
import 'package:flutter_zenn_api_freezed/components/error_view.dart';
import 'package:flutter_zenn_api_freezed/components/loading_view.dart';
import 'package:flutter_zenn_api_freezed/models/user/user.dart';
import 'package:flutter_zenn_api_freezed/services/api/api_error.dart';
import 'package:flutter_zenn_api_freezed/view_models/user_view_model.dart';

class UsersPage extends ConsumerWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: _buildBody(ref),
    );
  }

  Widget _buildBody(WidgetRef ref) {
    final usersState = ref.watch(usersViewModelProvider);

    return usersState.when(
      data: (data) => _buildIdleState(data),
      error: (error, _) => _buildErrorState(
        error as APIError,
      ),
      loading: () => const LoadingView(),
    );
  }

  /// Idle State
  Widget _buildIdleState(List<User> users) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final user = users[index];
        return ListTile(
          title: Text(user.name),
          subtitle: Text(user.phone),
        );
      },
      separatorBuilder: (context, index) => const Divider(
        color: Colors.black12,
      ),
      itemCount: users.length,
    );
  }

  /// Empty State
  Widget _buildErrorState(APIError error) {
    return error.when(noInternetConnection: () {
      return ErrorView(
        title: error.asAsyncValue().error.toString(),
      );
    }, notFound: () {
      return EmptyView(
        title: error.asAsyncValue().error.toString(),
      );
    }, serviceUnavailable: () {
      return ErrorView(
        title: error.asAsyncValue().error.toString(),
      );
    }, unknown: () {
      return ErrorView(
        title: error.asAsyncValue().error.toString(),
      );
    });
  }
}
