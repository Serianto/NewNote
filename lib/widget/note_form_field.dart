import 'package:aplikasi/utils/constant.dart';
import 'package:flutter/material.dart';

class NoteFormField extends StatelessWidget {
  const NoteFormField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.validator,
    this.onChanged,
    this.autofocus = false,
    this.filled,
    this.fillColor,
    this.suffixIcon,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.keyboardType}); 

    final TextEditingController? controller;
    final String? hintText;
    final String? labelText;
    final String? Function(String?)?validator;
    final void Function(String)? onChanged;
    final bool autofocus;
    final bool? filled;
    final Color? fillColor;
    final Widget? suffixIcon;
    final bool obscureText;
    final TextCapitalization textCapitalization;
    final TextInputAction? textInputAction;
    final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key, 
      controller: controller,
      autocorrect: autofocus,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        isDense: true,
        filled: filled,
        fillColor: fillColor,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primary)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primary)
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.redAccent)
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.redAccent)
        ),
      ),
      validator: validator, 
      onChanged: onChanged, 
      obscureText: obscureText, 
      textCapitalization: textCapitalization, 
      textInputAction: textInputAction, 
      keyboardType: keyboardType,
    );
  }
}