import 'package:flutter/material.dart';

class TextFieldForm extends StatelessWidget {
  final labelText;
  final prefixIcon;
  final maxLength;
  final textController;
  final isObscure;
  final maxLines;
  const TextFieldForm(
      {Key? key,
      required this.labelText,
      required this.prefixIcon,
      required this.maxLength,
      required this.isObscure,
      this.maxLines = 1,
      required this.textController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        labelText: labelText,
        prefixIcon: prefixIcon,
        focusColor: Colors.blue,
      ),
      maxLength: maxLength,
      controller: textController,
      maxLines: maxLines == 50 ? null : 1,
      obscureText: isObscure,
    );
  }
}
