import 'package:flutter/material.dart';
import 'package:idnstd/core/common/widgets/inputs/i_text_field.dart';

class EditProfileFormField extends StatelessWidget {
  const EditProfileFormField(
      {required this.fieldTitle,
      required this.controller,
      this.hintText,
        this.readonly,
        this.obscureText,
      super.key});
  final String fieldTitle;
  final TextEditingController controller;
  final String? hintText;
  final bool? readonly;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            fieldTitle,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
        const SizedBox(height: 10),
        ITextField(
          controller: controller,
          hintText: hintText,
          readOnly: readonly??false,
          obscureText: obscureText??false,
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
