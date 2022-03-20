import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error.freezed.dart';

@freezed
class APIError with _$APIError {
  const factory APIError.noInternetConnection() = _NoInternetConnection;
  const factory APIError.notFound() = _NotFound;
  const factory APIError.unknown() = _Unknown;
  const factory APIError.serviceUnavailable() = _ServiceUnavailable;
}

extension APIErrorAsync on APIError {
  AsyncValue<T> asAsyncValue<T>() => when(
        noInternetConnection: () => const AsyncValue.error('インターネットに接続されていません'),
        notFound: () => const AsyncValue.error('ユーザが見つかりませんでした'),
        unknown: () => const AsyncValue.error('不明なエラーが発生しました'),
        serviceUnavailable: () => const AsyncValue.error('サーバーメンテンス中です'),
      );
}
