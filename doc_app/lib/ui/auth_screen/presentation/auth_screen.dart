// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:doc_app/route_config/auto_route_config.gr.dart';
import 'package:doc_app/ui/theme/theme.dart';
import 'package:doc_app/ui/theme/widgets/appbar_widget.dart';
import 'package:doc_app/ui/theme/widgets/custom_button.dart';
import 'package:doc_app/ui/theme/widgets/custom_textfield.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({
    super.key,
    required this.isSignUp,
  });
  final bool isSignUp;
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppbarWidget(
          title: widget.isSignUp ? 'Let’s Sign Up' : 'Let’s Sign In',
          showBackButton: false,
        ),
      ),
      body: Padding(
        padding: horizontalPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title(),
            _fields(),
            _button(),
          ],
        ),
      ),
    );
  }

  _title() {
    return Column(
      children: [
        const SizedBox(height: 50),
        Text(
          widget.isSignUp ? 'Create\nAccount!' : "Welcome!",
          style: theme.textTheme.headlineLarge,
        ),
      ],
    );
  }

  _fields() {
    return Column(
      children: [
        SizedBox(height: widget.isSignUp ? 49 : 88),
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
        if (widget.isSignUp)
          Column(
            children: [
              SizedBox(
                height: 52,
                child: CustomTextField(
                  hintText: "Email",
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
            ],
          ),
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
        if (!widget.isSignUp)
          Column(
            children: [
              const SizedBox(height: 4),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    context.router.push(const ForgotPasswordRoute());
                  },
                  child: Text(
                    "Forgot Password",
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }

  _button() {
    return Column(
      children: [
        SizedBox(
          height: widget.isSignUp ? 35 : 75,
        ),
        CustomButton(
          onPressed: () {
            context.router.push(
              const HomeRoute(),
            );
          },
          title: widget.isSignUp ? "Sign up" : 'Sign In',
          isActive: true,
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.isSignUp
                  ? 'Already have an account? '
                  : "Don’t have an account? ",
              style: theme.textTheme.bodySmall,
            ),
            GestureDetector(
              onTap: () {
                if (widget.isSignUp) {
                  context.router.replace(
                    AuthRoute(isSignUp: false),
                  );
                } else {
                  context.router.replace(
                    AuthRoute(isSignUp: true),
                  );
                }
              },
              child: Text(
                widget.isSignUp ? "Sign In" : 'Sign Up',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
