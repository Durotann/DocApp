import 'package:auto_route/auto_route.dart';
import 'package:doc_app/route_config/auto_route_config.gr.dart';
import 'package:doc_app/ui/forgot_password_screen/widgets/pinput_widget.dart';
import 'package:doc_app/ui/theme/theme.dart';
import 'package:doc_app/ui/theme/widgets/appbar_widget.dart';
import 'package:doc_app/ui/theme/widgets/custom_button.dart';
import 'package:flutter/material.dart';

@RoutePage()
class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  late final TextEditingController pinputController;
  late final FocusNode focusNode;
  @override
  void initState() {
    pinputController = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    pinputController.dispose();

    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppbarWidget(
          title: "Verification Code",
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
            const SizedBox(height: 95),
            _pinput(),
            const SizedBox(height: 94),
            _button(),
          ],
        ),
      ),
    );
  }

  _title() {
    return Text(
      "Enter the code we sent you",
      style: theme.textTheme.bodyMedium,
    );
  }

  _pinput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        PinputWidget(
          pinputController: pinputController,
          validator: (value) {
            return null;
          },
          onChanged: (value) {},
          onCompleted: (value) {
            context.router.push(const ResetPasswordRoute());
          },
          errorView: false,
          focusNode: focusNode,
        ),
        const SizedBox(height: 10),
        Text(
          "Resent Code",
          style: theme.textTheme.bodyMedium?.copyWith(color: Colors.blue),
        ),
      ],
    );
  }

  _button() {
    return CustomButton(
      onPressed: () {},
      title: "Confirm",
      isActive: true,
    );
  }
}
