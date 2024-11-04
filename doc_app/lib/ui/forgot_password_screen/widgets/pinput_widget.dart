// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class PinputWidget extends StatelessWidget {
  const PinputWidget({
    super.key,
    required this.pinputController,
    required this.validator,
    required this.onChanged,
    required this.onCompleted,
    required this.errorView,
    required this.focusNode,
  });
  final TextEditingController? pinputController;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function(String)? onCompleted;
  final FocusNode? focusNode;
  final bool errorView;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    final defaultPinTheme = PinTheme(
      width: 63,
      height: 62,
      textStyle: theme.textTheme.displayLarge,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
    );

    return Pinput(
      length: 5,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d{0,5}$')),
      ],
      focusNode: focusNode,
      forceErrorState: errorView,
      onCompleted: onCompleted,
      onChanged: onChanged,
      separatorBuilder: (index) => SizedBox(width: width * 0.04),
      focusedPinTheme: defaultPinTheme,
      autofocus: true,
      defaultPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 5),
            ),
          ],
        ),
      ),
      errorPinTheme: PinTheme(
        width: 63,
        height: 62,
        textStyle: theme.textTheme.displayLarge
            ?.copyWith(color: theme.colorScheme.onError),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: theme.colorScheme.onError),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 5),
            ),
          ],
        ),
      ),
      errorTextStyle: const TextStyle(fontSize: 0),
      validator: validator,
      submittedPinTheme: PinTheme(
        width: 63,
        height: 62,
        textStyle: theme.textTheme.displayLarge,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color.fromRGBO(234, 239, 243, 1),
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 5),
            ),
          ],
        ),
      ),
      // smsRetriever: SmsRetriever.,
      controller: pinputController,
    );
  }
}
