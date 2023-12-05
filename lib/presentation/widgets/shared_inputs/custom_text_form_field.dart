import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final String? errorMessage;
  final bool obscureText;
  final void Function(String value)? onChanged;
  final String? Function(String? value)? validator;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hintText,
    this.errorMessage,
    this.obscureText = false,
    this.onChanged,
    this.validator, 
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
    );

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,     
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder:
            border.copyWith(borderSide: BorderSide(color: colors.primary)),

        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hintText,
        focusColor: colors.primary,        

        errorText: errorMessage, //'Este es el errorText',
        errorBorder: border.copyWith(borderSide: BorderSide(color: Colors.red)),
        focusedErrorBorder:
            border.copyWith(borderSide: BorderSide(color: Colors.red)),
      ),
    );
  }
}
