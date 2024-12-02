// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.inputFormatters,
    required this.onChanged,
    required this.prefixIcon,
    required this.keyboardType,
    required this.validator,
    this.readOnly = false,
    this.hintText = '',
    this.bottomBorder = 14,
    this.isSearching = false,
    this.onTap,
    required this.focusNode,
    required this.isValid,
    this.maxLines = 1,
    this.fontWeight = FontWeight.w400,
    this.suffix,
  });
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool readOnly;
  final String hintText;
  final FocusNode? focusNode;
  final bool isValid;
  final Function()? onTap;
  final double bottomBorder;
  final bool isSearching;
  final int? maxLines;
  final FontWeight fontWeight;
  final Widget? suffix;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      validator: validator,
      textAlignVertical: TextAlignVertical.top,
      readOnly: readOnly,
      maxLines: maxLines,
      focusNode: focusNode,
      onTap: onTap,
      style: !readOnly
          ? isValid
              ? theme.textTheme.displayMedium?.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontWeight: fontWeight,
                )
              : theme.textTheme.displayMedium?.copyWith(
                  color: theme.colorScheme.onError,
                  fontWeight: fontWeight,
                )
          : theme.textTheme.displaySmall?.copyWith(
              color: const Color.fromRGBO(156, 163, 176, 1),
            ),
      decoration: InputDecoration(
        hintStyle: theme.textTheme.displayMedium?.copyWith(color: Colors.grey),
        hintText: hintText,
        isDense: true,
        suffixIcon: suffix,
        contentPadding: prefixIcon != null
            ? const EdgeInsets.only(left: 0, right: 16, bottom: 16, top: 16)
            : const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        errorText: !isValid ? "Номер введен не корректно" : null,
        errorStyle: theme.textTheme.bodyMedium?.copyWith(
          fontSize: 0,
          color: theme.colorScheme.onError,
        ),
        filled: true,
        fillColor: isValid ? const Color(0xFFFFFFFF) : theme.colorScheme.error,
        border: !isSearching
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              )
            : const OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14)),
                borderSide: BorderSide.none,
              ),
        focusedBorder: !isSearching
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              )
            : const OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14)),
                borderSide: BorderSide.none,
              ),
        enabledBorder: !isSearching
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              )
            : const OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14)),
                borderSide: BorderSide.none,
              ),
        errorBorder: !isSearching
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              )
            : const OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14)),
                borderSide: BorderSide.none,
              ),
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(
                  top: 14,
                  left: 16,
                  right: 12,
                  bottom: 16,
                ),
                child: prefixIcon,
              )
            : null,
      ),
      inputFormatters: inputFormatters,
    );
  }
}
