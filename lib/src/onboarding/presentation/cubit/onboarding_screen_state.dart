part of 'onboarding_screen_cubit.dart';

sealed class OnboardingScreenState extends Equatable {
  const OnboardingScreenState();
  @override
  List<Object> get props => [];
}

final class OnboardingScreenInitial extends OnboardingScreenState {
  const OnboardingScreenInitial();
}

final class CachingFirstTimer extends OnboardingScreenState {
  const CachingFirstTimer();
}

final class CheckingIfUserIsFirstTimer extends OnboardingScreenState {
  const CheckingIfUserIsFirstTimer();
}

final class UserCached extends OnboardingScreenState {
  const UserCached();
}

final class OnboardingScreenStatus extends OnboardingScreenState {
  const OnboardingScreenStatus({required this.isFirstTimer});
  final bool isFirstTimer;
  @override
  List<Object> get props => [isFirstTimer];
}


final class OnboardingScreenError extends OnboardingScreenState {
  const OnboardingScreenError({required this.message});

  final String message;
  @override
  List<Object> get props => [message];
}
