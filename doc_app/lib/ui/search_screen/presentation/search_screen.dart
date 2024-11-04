import 'package:auto_route/auto_route.dart';
import 'package:doc_app/ui/search_screen/widgets/doctor_card_widget.dart';
import 'package:doc_app/ui/theme/theme.dart';
import 'package:doc_app/ui/theme/widgets/appbar_widget.dart';
import 'package:doc_app/ui/theme/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController searchController;
  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppbarWidget(
          title: 'Search',
        ),
      ),
      body: Padding(
        padding: horizontalPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            _searchField(),
            const SizedBox(height: 20),
            Text("Specialist", style: theme.textTheme.bodyMedium),
            const SizedBox(height: 9),
            _doctorsList(),
          ],
        ),
      ),
    );
  }

  _searchField() {
    return CustomTextField(
      suffix: Container(
        margin: const EdgeInsets.all(10),
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset(
          "images/settings.png",
          color: Colors.white,
        ),
      ),
      controller: searchController,
      inputFormatters: const [],
      onChanged: (value) {},
      prefixIcon: const Icon(
        Icons.search_rounded,
        color: Colors.grey,
        size: 22,
      ),
      keyboardType: TextInputType.multiline,
      validator: (value) {
        return null;
      },
      focusNode: null,
      isValid: true,
    );
  }

  _doctorsList() {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 13.0),
            child: DoctorCardWidget(),
          );
        },
      ),
    );
  }
}
