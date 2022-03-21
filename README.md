# flutter_api_freezed

## アーキテクチャ
View → ViewModel(riverpod) →　Repository →　DataSource →　Service(dio)

## クラス構成
UsersPage →　UsersViewModel(rivierpod) →　UserRepository →　UserRemoteDataSource(UserDataSource) →　APIService(dio)

## パッケージ

### dependencies:
```
  # state manegment
  flutter_riverpod: ^2.0.0-dev.4

  # parser
  freezed_annotation: ^1.1.0

  # API
  dio: ^4.0.4
  pretty_dio_logger: ^1.1.1
```


### dev_dependencies:
```
  flutter_lints: ^1.0.0
  build_runner:
  freezed:
  json_serializable:
```  
