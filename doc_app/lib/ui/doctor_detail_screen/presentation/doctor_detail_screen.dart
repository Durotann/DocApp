import 'package:auto_route/auto_route.dart';
import 'package:doc_app/ui/doctor_detail_screen/widgets/comment_widget.dart';
import 'package:doc_app/ui/doctor_detail_screen/widgets/statistic_widget.dart';
import 'package:doc_app/ui/theme/theme.dart';
import 'package:doc_app/ui/theme/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class DoctorDetailScreen extends StatefulWidget {
  const DoctorDetailScreen({super.key});

  @override
  State<DoctorDetailScreen> createState() => _DoctorDetailScreenState();
}

class _DoctorDetailScreenState extends State<DoctorDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(25),
        child: CustomButton(
          onPressed: () {},
          title: 'Get Appointment',
          isActive: true,
        ),
      ),
      backgroundColor: theme.colorScheme.primary,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: theme.colorScheme.primary,
        automaticallyImplyLeading: false,
        leadingWidth: 70,
        leading: GestureDetector(
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
        ),
        title: Text(
          "Doctor Detail",
          style:
              theme.appBarTheme.titleTextStyle?.copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 22),
            image(),
            const SizedBox(height: 28),
            stats(),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(80),
                  topRight: Radius.circular(80),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30),
                child: Column(
                  children: [
                    title(),
                    const SizedBox(height: 19),
                    description(),
                    const SizedBox(height: 17),
                    comments(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget image() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      height: 121,
      width: 112,
    );
  }

  Widget stats() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 71.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StatWidget(
            title: "150+",
            description: "Patient",
            image: "images/like.svg",
          ),
          StatWidget(
            title: "10 years",
            description: "Experiance",
            image: "images/king.svg",
          ),
          StatWidget(
            title: "4.9",
            description: "Rating",
            image: "images/star.svg",
          ),
        ],
      ),
    );
  }

  Widget title() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Dr. Kawsar Ahmed",
          style: theme.textTheme.labelMedium?.copyWith(
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          "Cardiologist- Cumilla Madical Collage",
          style: theme.textTheme.displayMedium?.copyWith(color: Colors.grey),
        ),
        RatingBar.builder(
          ignoreGestures: true,
          initialRating: 5,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => SvgPicture.asset("images/star-rate.svg"),
          itemSize: 19,
          onRatingUpdate: (rating) {},
        ),
      ],
    );
  }

  Widget description() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "About Doctor",
            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.black),
          ),
          const SizedBox(height: 12),
          Text(
            "Dr. Kawsar Ahmed is the top most Cardiologist specialist in Cumilla Medical Collage Hospital AtCumilla. He achived several awards foe hiswonderful confriution in his own field. He isavaliable for privet consulatation. He achivedseveral awards foe his wonderful confriution inhis own field. He is avaliable for privetconsulatation.",
            style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  Widget comments() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Recent comments",
              style: theme.textTheme.bodyMedium?.copyWith(color: Colors.black),
            ),
            Text(
              "2 Hour Ago",
              style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.17,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const CommentWidget(
                image:
                    "https://cs14.pikabu.ru/post_img/big/2022/12/08/11/167052924613938865.jpg",
                countStar: 5,
              );
            },
          ),
        ),
      ],
    );
  }
}
