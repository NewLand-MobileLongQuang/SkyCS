import 'package:flutter/material.dart';
import 'package:idnstd/core/common/widgets/gradient_background.dart';
import 'package:idnstd/core/res/media_res.dart';
import 'package:lottie/lottie.dart';

class PageUnderConstruction extends StatelessWidget {
  const PageUnderConstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        image: AppMediaRes.backgroundImg,
        child: Center(child: Lottie.asset(AppMediaRes.underConstructionLottie)),
        ),
      );
  }
}
