import 'package:flutter/material.dart';

import 'package:e_commerce/constant.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String hint;
  final String? initialValue;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final bool obscureText;
  final TextInputType textInputType;
  final int? maxLines;

  CustomTextFormField({
    Key? key,
    required this.title,
    required this.hint,
    this.initialValue,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.obscureText = false,
    this.textInputType = TextInputType.name,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 17),
        ),
        TextFormField(
          initialValue: initialValue,
          keyboardType: textInputType,
          onSaved: onSaved,
          validator: validator,
          cursorColor: k_primary,
          obscureText: obscureText,
          onChanged: onChanged,
          maxLines: maxLines,
          minLines: 1,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 18,
              ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 17),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: k_primary),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: k_primary),
            ),
          ),
        ),
      ],
    );
  }
}
