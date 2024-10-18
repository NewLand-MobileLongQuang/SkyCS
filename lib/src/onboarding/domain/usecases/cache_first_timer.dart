import 'package:idnstd/core/usecases/usecase.dart';
import 'package:idnstd/core/utils/typedef.dart';
import 'package:idnstd/src/onboarding/domain/repos/onboarding_screen_repo.dart';

class CacheFirstTimer extends UsecaseWithoutParams<void>
{

  const CacheFirstTimer(this._repo);
  final OnboardingScreenRepo _repo;
  @override
  ResultFuture<void> call() async => _repo.cacheFirstTimer();

}
