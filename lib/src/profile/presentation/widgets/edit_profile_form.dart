import 'package:flutter/material.dart';
import 'package:idnstd/core/common/widgets/inputs/i_select_field.dart';
import 'package:idnstd/core/extensions/context_extension.dart';
import 'package:idnstd/core/extensions/string_extensions.dart';
import 'package:idnstd/src/profile/presentation/widgets/edit_profile_form_field.dart';

class EditProfileForm extends StatelessWidget {
  EditProfileForm(
      {required this.nameController,
      required this.emailController,
      required this.newPasswordController,
      required this.oldPasswordController,
      required this.retypePasswordController,
      super.key});

  final TextEditingController nameController;
  final TextEditingController emailController;

  // final languageController = TextEditingController();
  // final timeZoneController = TextEditingController();
  final TextEditingController newPasswordController;
  final TextEditingController oldPasswordController;
  final TextEditingController retypePasswordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        EditProfileFormField(
          fieldTitle: 'Full Name',
          controller: nameController,
          hintText: context.currentUser?.Name!,
        ),
        EditProfileFormField(
          fieldTitle: 'Email',
          controller: emailController,
          hintText: context.currentUser?.Email!.obscureEmail,
          readonly: true,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Language',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
            const SizedBox(height: 10),
            // DropdownButtonFormField(
            //   value: context.currentUser!.Language,
            //   items: [
            //     DropdownMenuItem(child: Text('Tiếng Việt'), value: 'vi',),
            //     DropdownMenuItem(child: Text('English'), value: 'en',),
            //   ],
            //   onChanged: (v) {},
            // ),

            // ISelectField(
            //   hintText: "Gender",
            //   options: ["Male", "Female"],
            //   value: 'Male',
            //   onChanged: (_value_) {},
            //   getLabel: (String value) => value,
            // ),
            const SizedBox(height: 30),
          ],
        ),
        EditProfileFormField(
          fieldTitle: 'Current Password',
          controller: oldPasswordController,
          hintText: '********',
        ),
        EditProfileFormField(
          fieldTitle: 'New Password',
          controller: newPasswordController,
          hintText: 'Enter new password',
          obscureText: true,
        ),
        EditProfileFormField(
          fieldTitle: 'Retype new Password',
          controller: retypePasswordController,
          hintText: 'Retype new password',
          obscureText: true,
        ),
      ],
    );
  }
}
