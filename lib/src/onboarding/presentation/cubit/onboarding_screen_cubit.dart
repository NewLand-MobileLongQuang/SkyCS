import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:idnstd/src/onboarding/domain/usecases/cache_first_timer.dart';
import 'package:idnstd/src/onboarding/domain/usecases/check_if_user_is_first_timer.dart';

part 'onboarding_screen_state.dart';

class OnboardingScreenCubit extends Cubit<OnboardingScreenState> {
  OnboardingScreenCubit({
    required CacheFirstTimer cacheFirstTimer,
    required CheckIfUserIsFirstTimer checkIfUserIsFirstTimer,
  })  : _cacheFirstTimer = cacheFirstTimer,
        _checkIfUserIsFirstTimer = checkIfUserIsFirstTimer,
        super(const OnboardingScreenInitial());

  final CacheFirstTimer _cacheFirstTimer;
  final CheckIfUserIsFirstTimer _checkIfUserIsFirstTimer;

  Future<void> cacheFirstTimer() async {

    emit(const CachingFirstTimer());
    final result = await _cacheFirstTimer();
    result.fold((failure) => emit(OnboardingScreenError(message: failure.Message)),
        (r) => emit(const UserCached()));
  }

  Future<void> checkIfUserIsFirstTimer() async {
    emit(const CheckingIfUserIsFirstTimer());
    final result = await _checkIfUserIsFirstTimer();
    result.fold((failure) => emit(const OnboardingScreenStatus(isFirstTimer: true)),
        (status) => emit(OnboardingScreenStatus(isFirstTimer: status)));
  }
}
