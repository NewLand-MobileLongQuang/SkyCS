import 'package:flutter/material.dart';
import 'package:idnstd/core/common/widgets/gradient_background.dart';
import 'package:idnstd/core/extensions/context_extension.dart';
import 'package:idnstd/core/res/media_res.dart';
import 'package:idnstd/src/profile/presentation/widgets/profile_app_bar.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ProfileAppBar(),
      body: GradientBackground(
        image: AppMediaRes.backgroundImg,
        child: Center(
          child: Text('Hello ${context.currentUser?.Name}'),
        )
      ),
    );
  }
}
