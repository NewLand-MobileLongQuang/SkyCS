import 'package:idnstd/core/usecases/usecase.dart';
import 'package:idnstd/core/utils/typedef.dart';
import 'package:idnstd/src/onboarding/domain/repos/onboarding_screen_repo.dart';

class CheckIfUserIsFirstTimer extends UsecaseWithoutParams<bool> {
  const CheckIfUserIsFirstTimer(this._repo);
  final OnboardingScreenRepo _repo;
  @override
  ResultFuture<bool> call() async => this._repo.checkIfUserIsFirstTimer();
}
