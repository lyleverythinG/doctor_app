import 'package:doctor_app/core/reusable_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ProvideDoctorInformation extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String errorText;
  final TextInputType textInputType;
  const ProvideDoctorInformation(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.errorText,
      required this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: controller,
          keyboardType: textInputType,
          data: Icons.person,
          hintText: hintText,
          isObscure: false,
          validator: (text) {
            if (text == null || text.isEmpty) {
              return errorText;
            }
            return null;
          },
        ),
      ],
    );
  }
}
