// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

class CommentWidget extends StatefulWidget {
  const CommentWidget({
    super.key,
    required this.image,
    required this.countStar,
  });
  final String image;
  final int countStar;
  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: NetworkImage(widget.image), fit: BoxFit.cover),
          ),
        ),
        const SizedBox(width: 7),
        RatingBar.builder(
          ignoreGestures: true,
          initialRating: widget.countStar.toDouble(),
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 19,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => SvgPicture.asset("images/star-rate.svg"),
          onRatingUpdate: (rating) {},
        ),
      ],
    );
  }
}
