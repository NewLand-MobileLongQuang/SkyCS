import 'package:idnstd/core/utils/typedef.dart';

abstract class OnboardingScreenRepo {
  const OnboardingScreenRepo();

  ResultFuture<bool> checkIfUserIsFirstTimer();
  ResultVoid cacheFirstTimer();

}