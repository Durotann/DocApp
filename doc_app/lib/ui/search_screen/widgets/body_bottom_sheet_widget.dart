import 'package:flutter/material.dart';

import 'package:doc_app/ui/theme/theme.dart';

class BodyBottomSheetWidget extends StatelessWidget {
  const BodyBottomSheetWidget({
    super.key,
    required this.filtres,
    required this.title,
  });
  final List<Widget> filtres;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: theme.textTheme.bodyMedium,
        ),
        Wrap(
          alignment: WrapAlignment.start,
          runSpacing: 10,
          spacing: 10,
          children: filtres,
        ),
      ],
    );
  }
}
