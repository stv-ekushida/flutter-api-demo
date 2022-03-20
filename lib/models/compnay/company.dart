import 'package:freezed_annotation/freezed_annotation.dart';

part 'company.freezed.dart';
part 'company.g.dart';

@freezed
abstract class Company with _$Company {
  const factory Company({
    required String name,
  }) = _Company;

  //pubspec.yaml: json_serializable:
  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}
