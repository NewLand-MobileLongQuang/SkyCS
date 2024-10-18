import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:idnstd/core/common/widgets/gradient_background.dart';
import 'package:idnstd/core/common/widgets/inputs/i_select_field.dart';
import 'package:idnstd/core/common/widgets/inputs/i_text_field.dart';
import 'package:idnstd/core/common/widgets/nested_back_button.dart';
import 'package:idnstd/core/extensions/context_extension.dart';
import 'package:idnstd/core/extensions/string_extensions.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/utils/typedef.dart';
import 'package:idnstd/src/profile/presentation/cubit/profile_cubit.dart';
import 'package:idnstd/src/profile/presentation/widgets/edit_profile_form.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/res/media_res.dart';
import '../../../../core/utils/core_utils.dart';
import '../widgets/edit_profile_form_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  // final languageController = TextEditingController();
  // final timeZoneController = TextEditingController();
  final newPasswordController = TextEditingController();
  final oldPasswordController = TextEditingController();
  final retypePasswordController = TextEditingController();

  bool get nameChanged =>
      context.currentUser?.Name != nameController.text.trim();

  bool get passwordChanged => newPasswordController.text.isNotEmpty;

  bool get nothingChanged =>
      !nameChanged && !passwordChanged && !languageChanged;

  final formKey = GlobalKey<FormState>();

  File? pickedImage;

  bool obscurePassword = true;

  bool get languageChanged => _language != context.currentUser!.Language;
  String _language = 'en';

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    oldPasswordController.dispose();
    newPasswordController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    nameController.text = context.currentUser?.Name ?? '';

    _language = context.currentUser!.Language!;
    super.initState();
  }

  @override
  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        pickedImage = File(image.path);
      });
    }
  }

  static const Map<String, String> _languageMap = {
    'vi': 'Tiếng Việt',
    'en': 'English'
  };

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(listener: (context, state) {
      if (state is ProfileStateError) {
        CoreUtils.showSnackBar(context, state.message);
      } else if (state is ProfileStateSaved) {

        CoreUtils.showSnackBar(context, 'Profile updated');
        context.pop();
      }
    }, builder: (context, state) {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.white,
            leading: NestedBackButton(),
            title: const Text('Edit profile'),
            actions: [
              TextButton(
                  onPressed: () {
                    if (nothingChanged) {
                      context.pop();
                      return;
                    }

                    if (passwordChanged) {
                      if (oldPasswordController.text.isEmpty) {
                        CoreUtils.showSnackBar(
                            context, 'Please enter your current password!');

                        return;
                      }
                    }

                    context.read<ProfileCubit>().saveUserProfile(
                        name: nameController.text.trim(),
                        avatar: '',
                        accessToken: 'accessToken',
                        language: _language,
                        newPassword: newPasswordController.text.trim(),
                        currentPassword: oldPasswordController.text.trim());
                  },
                  child: state == ProfileStateLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : StatefulBuilder(
                          builder: (_, refresh) {
                            nameController.addListener(() => refresh(() {}));
                            newPasswordController
                                .addListener(() => refresh(() {}));

                            return Text(
                              'Done',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: nothingChanged
                                    ? Colors.grey
                                    : Colors.blueAccent,
                              ),
                            );
                          },
                        ))
            ],
          ),
          body: GradientBackground(
              image: AppMediaRes.backgroundImg,
              child: SafeArea(
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    StatefulBuilder(
                      builder: (_, refresh) {
                        final user = context.currentUser!;
                        final userImage = user.Avatar ?? null;
                        return CircleAvatar(
                          radius: 50,
                          backgroundImage: pickedImage != null
                              ? FileImage(pickedImage!)
                              : userImage != null
                                  ? NetworkImage(userImage)
                                  : const AssetImage(AppMediaRes.backgroundImg)
                                      as ImageProvider,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black.withOpacity(.5),
                                ),
                              ),
                              IconButton(
                                  onPressed: pickImage,
                                  icon: Icon(
                                      pickedImage != null || user.Avatar != null
                                          ? Icons.edit
                                          : Icons.add_a_photo),
                                  color: Colors.white),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'We recommend an image of at least 400x400',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black45,
                          ),
                        )),
                    // EditProfileForm(
                    //   nameController: nameController,
                    //   emailController: emailController,
                    //   newPasswordController: newPasswordController,
                    //   oldPasswordController: oldPasswordController,
                    //   retypePasswordController: retypePasswordController,
                    // )

                    const SizedBox(
                      height: 30,
                    ),
                    ITextField(
                      label: 'Full Name',
                      controller: nameController,
                      hintText: context.currentUser?.Name!,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ITextField(
                      label: 'Email',
                      controller: emailController,
                      hintText: context.currentUser?.Email!.obscureEmail,
                      readOnly: true,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // ISelectField(
                    //   hintText: 'Language',
                    //   options: _languageMap.keys.toList(),
                    //   value: _language,
                    //   onChanged: (_value_) {
                    //     setState((v) {
                    //       _language = v.toString();
                    //     } as VoidCallback);
                    //   },
                    //   getLabel: (value) => _languageMap[value] ?? '',
                    // ),
                    const SizedBox(
                      height: 30,
                    ),

                    ITextField(
                      label: 'Current Password',
                      controller: oldPasswordController,
                      hintText: 'Leave blank to leave unchanged',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ITextField(
                      label: 'New Password',
                      controller: newPasswordController,
                      hintText: 'Leave blank to leave unchanged',
                      obscureText: obscurePassword,
                      suffixIcon: IconButton(
                          onPressed: () => setState(() {
                                obscurePassword = !obscurePassword;
                              }),
                          icon: Icon(obscurePassword
                              ? IconlyLight.show
                              : IconlyLight.hide)),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )));
    });
  }
}
