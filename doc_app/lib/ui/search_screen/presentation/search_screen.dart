import 'package:auto_route/auto_route.dart';
import 'package:doc_app/data/models/filtres_model/filtres_model.dart';
import 'package:doc_app/ui/search_screen/widgets/body_bottom_sheet_widget.dart';
import 'package:doc_app/ui/search_screen/widgets/doctor_card_widget.dart';
import 'package:doc_app/ui/theme/theme.dart';
import 'package:doc_app/ui/theme/widgets/appbar_widget.dart';
import 'package:doc_app/ui/theme/widgets/custom_button.dart';
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
          showBackButton: false,
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
      suffix: GestureDetector(
        onTap: () {
          _showModalBottomSheet();
        },
        child: Container(
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

  _showModalBottomSheet() {
    return showModalBottomSheet<void>(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: horizontalPadding.copyWith(bottom: 25, top: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  BodyBottomSheetWidget(
                    filtres: [
                      for (final item in [
                        FiltresModel(name: "Dermatology", isSelected: true),
                        FiltresModel(name: "Dermat", isSelected: true),
                        FiltresModel(name: "Dermatology", isSelected: false),
                        FiltresModel(name: "Dermatology", isSelected: false),
                      ])
                        FilterChip(
                          showCheckmark: false,
                          selectedColor: Colors.blue,
                          label: Text(
                            item.name,
                            style: theme.textTheme.titleMedium?.copyWith(
                              color:
                                  item.isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                          selected: item.isSelected,
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                item.isSelected = true;
                              }
                            });
                          },
                        )
                    ],
                    title: "Categories",
                  ),
                  const SizedBox(height: 25),
                  BodyBottomSheetWidget(
                    filtres: [
                      for (final item in [
                        FiltresModel(name: "Dermatology", isSelected: false),
                        FiltresModel(name: "Dermat", isSelected: false),
                        FiltresModel(name: "Dermatology", isSelected: false),
                        FiltresModel(name: "Dermatology", isSelected: false),
                      ])
                        FilterChip(
                          showCheckmark: false,
                          label: Text(item.name),
                          selected: item.isSelected,
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                item.isSelected = true;
                              }
                            });
                          },
                        )
                    ],
                    title: "Categories",
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                      onPressed: () {}, title: 'Apply Filters', isActive: true),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 52,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "Clear Filters",
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
