import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String textHint;
  final bool? obscureText;
  final bool enableSuggest;
  final bool autoCorrect;

  const CustomTextFormField({
    super.key,
    this.keyboardType,
    this.controller,
    required this.textHint,
    required this.obscureText,
    required this.enableSuggest,
    required this.autoCorrect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 250,
      padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText!,
        enableSuggestions: enableSuggest,
        autocorrect: autoCorrect,
        decoration: InputDecoration(
          hint: Text(textHint),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
