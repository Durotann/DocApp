// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:doc_app/ui/theme/theme.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({
    super.key,
    required this.title,
    this.showBackButton = true,
  });
  final String title;
  final bool showBackButton;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: theme.scaffoldBackgroundColor,
      automaticallyImplyLeading: false,
      leadingWidth: 70,
      leading: showBackButton
          ? GestureDetector(
              onTap: () {
                context.router.maybePop();
              },
              child: Container(
                margin: const EdgeInsets.only(left: 25),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back_sharp,
                  ),
                ),
              ),
            )
          : null,
      title: Text(title),
    );
  }
}
