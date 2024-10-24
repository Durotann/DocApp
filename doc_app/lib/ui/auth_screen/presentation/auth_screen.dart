import 'package:auto_route/auto_route.dart';
import 'package:doc_app/ui/theme/theme.dart';
import 'package:doc_app/ui/theme/widgets/appbar_widget.dart';
import 'package:doc_app/ui/theme/widgets/custom_button.dart';
import 'package:doc_app/ui/theme/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppbarWidget(
          title: 'Let’s Sign Up',
          showBackButton: false,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Text(
              "Welcome!",
              style: theme.textTheme.headlineLarge,
            ),
            _fields(context),
            _button(context),
          ],
        ),
      ),
    );
  }
}

_fields(BuildContext context) {
  return Column(
    children: [
      const SizedBox(height: 88),
      SizedBox(
        height: 52,
        child: CustomTextField(
          hintText: "Name",
          controller: TextEditingController(),
          inputFormatters: const [],
          onChanged: (value) {},
          prefixIcon: null,
          keyboardType: TextInputType.text,
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
          hintText: "Password",
          controller: TextEditingController(),
          inputFormatters: const [],
          onChanged: (value) {},
          prefixIcon: null,
          keyboardType: TextInputType.text,
          validator: (value) {
            return null;
          },
          focusNode: null,
          isValid: true,
        ),
      ),
      const SizedBox(height: 4),
      Align(
        alignment: Alignment.centerRight,
        child: Text(
          "Forgot Password",
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
      ),
    ],
  );
}

_button(BuildContext context) {
  return Column(children: [
    const SizedBox(height: 75),
    CustomButton(
      onPressed: () {},
      title: "Sign up",
      isActive: true,
    ),
    const SizedBox(
      height: 15,
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: theme.textTheme.bodySmall,
        ),
        Text(
          "Sign In",
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
      ],
    )
  ]);
}
