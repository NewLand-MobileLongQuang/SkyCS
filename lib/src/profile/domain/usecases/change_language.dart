import 'package:idnstd/core/usecases/usecase.dart';
import 'package:idnstd/core/utils/typedef.dart';
import 'package:idnstd/src/profile/domain/repos/profile_repo.dart';

class ChangeLanguage extends UsecaseWithParams<void, String> {
  ChangeLanguage(this._repo);
  final ProfileRepo _repo;

  @override
  ResultFuture<void> call(String params) {
    return _repo.changeLanguage(language: params);
  }
}