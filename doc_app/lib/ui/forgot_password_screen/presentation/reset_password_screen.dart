import 'package:auto_route/auto_route.dart';
import 'package:doc_app/route_config/auto_route_config.gr.dart';
import 'package:doc_app/ui/theme/theme.dart';
import 'package:doc_app/ui/theme/widgets/appbar_widget.dart';
import 'package:doc_app/ui/theme/widgets/custom_button.dart';
import 'package:doc_app/ui/theme/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late final TextEditingController newPasswordController;
  late final TextEditingController confirmPasswordController;

  @override
  void initState() {
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppbarWidget(
          title: "Reset Password",
          showBackButton: true,
        ),
      ),
      body: Padding(
        padding: horizontalPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 23),
            _title(),
            const SizedBox(height: 96),
            _fields(),
            const SizedBox(height: 55),
            _button(),
          ],
        ),
      ),
    );
  }

  _title() {
    return Text(
      "Enter a new password",
      style: theme.textTheme.bodyMedium,
    );
  }

  _fields() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 52,
          child: CustomTextField(
            hintText: 'New Password',
            controller: newPasswordController,
            inputFormatters: const [],
            onChanged: (value) {},
            prefixIcon: null,
            keyboardType: TextInputType.multiline,
            validator: (value) {
              return null;
            },
            focusNode: null,
            isValid: true,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 52,
          child: CustomTextField(
            hintText: 'Confirm Password',
            controller: confirmPasswordController,
            inputFormatters: const [],
            onChanged: (value) {},
            prefixIcon: null,
            keyboardType: TextInputType.multiline,
            validator: (value) {
              return null;
            },
            focusNode: null,
            isValid: true,
          ),
        ),
      ],
    );
  }

  _button() {
    return CustomButton(
      onPressed: () {},
      title: 'Confirm',
      isActive: true,
    );
  }
}
