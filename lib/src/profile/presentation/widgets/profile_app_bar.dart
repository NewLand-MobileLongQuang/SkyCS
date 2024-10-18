import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idnstd/core/common/app/Entities/session_info.dart';
import 'package:idnstd/core/common/widgets/popup_item.dart';
import 'package:idnstd/core/extensions/context_extension.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/services/injection_container.dart';
import 'package:idnstd/src/auth/domain/usecases/save_session_info.dart';
import 'package:idnstd/src/profile/presentation/cubit/profile_cubit.dart';
import 'package:idnstd/src/profile/presentation/views/edit_profile_screen.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Profile'),

      actions: [
        PopupMenuButton(
          offset: const Offset(0, 50),
          //shape: RoundedRectangleBorder(borderRadius: 10, side: BorderSide.),
          surfaceTintColor: Colors.white,

          itemBuilder: (_) => [
            PopupMenuItem<void>(
              child: PopupItem(
                title: 'Edit Profile',
                icon: Icon(
                  Icons.edit_outlined,
                  color: AppColors.textBlackColor,
                ),
              ),
              onTap: () {

                context.push(
                  BlocProvider(create: (_)=>sl<ProfileCubit>(),
                  child: const EditProfileScreen(),)
                );
              },
            ),
            PopupMenuItem<void>(
              height: 1,
              padding: EdgeInsets.zero,
              child: Divider(
                height: 1,
                color: Colors.grey.shade50,
                endIndent: 16,
                indent: 16,
              ),
            ),
            PopupMenuItem<void>(
              child: PopupItem(
                title: 'Log out',
                icon: Icon(
                  Icons.logout,
                  color: AppColors.textBlackColor,
                ),
              ),
              onTap: () {
                //TODO: logout
                context.userProvider.initSession(null);
                sl<SaveSessionInfo>()(null);
                SessionInfo.reset();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              },
            )
          ],
        )
      ],
      backgroundColor: Colors.transparent,
      foregroundColor: AppColors.textBlackColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
