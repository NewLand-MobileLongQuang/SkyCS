import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idnstd/core/common/app/entities/session_info.dart';
import 'package:idnstd/core/extensions/context_extension.dart';
import 'package:idnstd/core/services/injection_container.dart';
import 'package:idnstd/core/services/router.dart';
import 'package:idnstd/src/auth/presentation/cubit/auth_cubit.dart';
import 'package:idnstd/src/auth/presentation/views/login_screen.dart';
import 'package:idnstd/src/auth/presentation/views/select_network_screen.dart';
import 'package:idnstd/src/dashboard/presentation/views/dashboard.dart';
import 'package:idnstd/src/onboarding/presentation/cubit/onboarding_screen_cubit.dart';
import 'package:idnstd/src/onboarding/presentation/views/onboarding_screen.dart';

PageRouteBuilder? handleCaseAuth(RouteSettings settings) {
  switch(settings.name){
    case '/':
      final session = SessionInfo.current();
      return pageBuilder(
              (context) {
            if (session.isAuthenticated()) {
              context.userProvider.initSession(session);
              if (session.org != null) {
                return const Dashboard();
              } else {
                return BlocProvider(
                    create: (_) => sl<AuthCubit>(), child: const SelectNetworkScreen()
                );
              }
            }
            return BlocProvider(
                create: (_) => sl<AuthCubit>(), child: const LoginScreen());
          },
          settings: settings
      );

    case LoginScreen.routeName:
      return pageBuilder(
              (p0) => BlocProvider(
              create: (_) => sl<AuthCubit>(), child: const LoginScreen()),
          settings: settings);

    case SelectNetworkScreen.routeName:
      return pageBuilder(
              (p0) => BlocProvider(
              create: (_) => sl<AuthCubit>(),
              child: const SelectNetworkScreen()),
          settings: settings);

    case OnboardingScreen.routeName:
      return pageBuilder(
              (p0) => BlocProvider(
              create: (_) => sl<OnboardingScreenCubit>(),
              child: const OnboardingScreen()),
          settings: settings);

    default:
      return null;
  }
}