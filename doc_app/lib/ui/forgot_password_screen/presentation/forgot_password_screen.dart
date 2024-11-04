import 'package:auto_route/auto_route.dart';
import 'package:doc_app/route_config/auto_route_config.gr.dart';
import 'package:doc_app/ui/theme/theme.dart';
import 'package:doc_app/ui/theme/widgets/appbar_widget.dart';
import 'package:doc_app/ui/theme/widgets/custom_button.dart';
import 'package:doc_app/ui/theme/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late final TextEditingController emailController;
  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppbarWidget(
          title: "Forgot Password",
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
            const SizedBox(height: 74),
            _field(),
            const SizedBox(height: 16),
            _button(),
          ],
        ),
      ),
    );
  }

  _title() {
    return Text(
      "We need your registration phon number\nto send you password reset code!",
      style: theme.textTheme.bodyMedium,
    );
  }

  _field() {
    return CustomTextField(
      hintText: 'xxxxx@gmail.com',
      controller: emailController,
      inputFormatters: const [],
      onChanged: (value) {},
      prefixIcon: null,
      keyboardType: TextInputType.multiline,
      validator: (value) {
        return null;
      },
      focusNode: null,
      isValid: true,
    );
  }

  _button() {
    return CustomButton(
      onPressed: () {
        context.router.push(VerificationCodeRoute());
      },
      title: 'Send Code',
      isActive: true,
    );
  }
}
