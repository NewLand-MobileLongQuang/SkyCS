import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:idnstd/core/common/views/loading_view.dart';
import 'package:idnstd/core/common/widgets/gradient_background.dart';
import 'package:idnstd/core/extensions/context_extension.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/media_res.dart';
import 'package:idnstd/src/onboarding/presentation/cubit/onboarding_screen_cubit.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static const routeName = '/onboarding';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<OnboardingScreenCubit>();
    final String avatar= context.currentUser!=null? context.currentUser?.Avatar ?? '' : '';
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Image.asset(AppMediaRes.logoIcon),),
        title: const Text( 'Ecore App'),

        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications)),

          IconButton(onPressed: (){}, icon: avatar!=''?Image.network(avatar): const Icon( IconlyLight.user)),
        ],
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.textWhiteColor,

      ),
      body: GradientBackground(
        image: AppMediaRes.backgroundImg,
        child: BlocConsumer<OnboardingScreenCubit, OnboardingScreenState>(
            listener: (context, state) {
          if (state is OnboardingScreenStatus && !state.isFirstTimer) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (state is UserCached) {
            //TODO(User-Cached Handler): push to approriate screen
          }
        }, builder: (context, state) {
          if (state is CheckingIfUserIsFirstTimer || state is CachingFirstTimer) {
            return const LoadingView();
          }
          return const Center(
            child: Text('Welcome, FirsTimer!'),
          );
        }),
      ),
    );
  }
}
