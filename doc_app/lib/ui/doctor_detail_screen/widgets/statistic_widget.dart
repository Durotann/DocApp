// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:doc_app/ui/theme/theme.dart';

class StatWidget extends StatelessWidget {
  const StatWidget({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });
  final String title;
  final String description;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.colorScheme.secondary,
          ),
          child: Center(
            child: SvgPicture.asset(
              image,
              fit: BoxFit.scaleDown,
              height: 19,
              width: 19,
            ),
          ),
        ),
        const SizedBox(height: 7),
        Text(
          title,
          style: theme.textTheme.displayMedium?.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 2),
        Text(
          description,
          style: theme.textTheme.titleSmall?.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
