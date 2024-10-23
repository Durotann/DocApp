import 'package:auto_route/auto_route.dart';
import 'package:doc_app/ui/theme/theme.dart';
import 'package:doc_app/ui/theme/widgets/appbar_widget.dart';
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
            const SizedBox(height: 88),
            SizedBox(
              height: 52,
              child: CustomTextField(
                controller: TextEditingController(),
                inputFormatters: [],
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
                controller: TextEditingController(),
                inputFormatters: [],
                onChanged: (value) {},
                prefixIcon: null,
                keyboardType: TextInputType.text,
                validator: (value) {
                  return null;
                },
                focusNode: null,
                isValid: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
