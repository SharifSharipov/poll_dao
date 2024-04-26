import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../data/models/data_cetegory_model.dart';

class CategoryProvider with ChangeNotifier {
  int? _selectedCategoryId;

  int? get selectedCategoryId => _selectedCategoryId;

  set selectedCategoryId(int? id) {
    _selectedCategoryId = id;
    print("set selected category $id");
    notifyListeners(); // Уведомить слушателей об изменении
  }
}

class SelectCategory extends StatefulWidget {
  const SelectCategory({
    super.key,
    required this.selectColor,
  });

  final bool selectColor;

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  Future<List<DataCategoryModel>> categories = fetchCategories();

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context, listen: false);

    return FutureBuilder<List<DataCategoryModel>>(
      future: categories,
      builder: (context, snapshot) {
        final bool isLoading = snapshot.connectionState == ConnectionState.waiting;
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (isLoading) {
          return Wrap(
            spacing: 10,
            runSpacing: 4,
            children: List.generate(
              8,
              (index) {
                return Chip(
                  label: Text(
                    List.generate(10 + index * 2, (index) => ' ').join(),
                    style: const TextStyle(
                      color: AppColors.c_A0A4A7,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  side: BorderSide.none,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  backgroundColor: AppColors.c_A0A4A7.withOpacity(0.5),
                );
              },
            ),
          );
        }
        final List<DataCategoryModel> categories = snapshot.data!;
        final catCountPerStroke = categories.length / 3.ceil();
        final width = MediaQuery.sizeOf(context).width;
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: catCountPerStroke * (width * 0.5),
            child: Row(
              children: [
                Expanded(
                  child: Wrap(
                    children: List.generate(
                      categories.length,
                      (index) {
                        final item = categories[index];
                        return CategorieChip(
                          id: item.id,
                          title: item.name,
                          select: item.id == categoryProvider.selectedCategoryId,
                          onSelectionChanged: () {
                            setState(() {
                              if (categoryProvider.selectedCategoryId == item.id) {
                                categoryProvider.selectedCategoryId = null;
                              } else {
                                categoryProvider.selectedCategoryId = item.id;
                              }
                            });
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Future<List<DataCategoryModel>> fetchCategories() async {
  final response = await http.get(Uri.parse('http://94.131.10.253:3000/public/topics'));

  if (response.statusCode == 200) {
    final List<dynamic> dataJson = jsonDecode(response.body);
    List<DataCategoryModel> data = dataJson.map((json) => DataCategoryModel.fromJson(json)).toList();
    return data;
  } else {
    throw Exception('Failed to load data');
  }
}

class CategorieChip extends StatelessWidget {
  final bool select;
  final String title;
  final int id;
  final VoidCallback onSelectionChanged;

  const CategorieChip({
    super.key,
    required this.select,
    required this.title,
    required this.id,
    required this.onSelectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.5),
      child: GestureDetector(
        onTap: onSelectionChanged,
        child: ZoomTapAnimation(
          child: Chip(
            label: Text(
              title,
              style: TextStyle(
                color: select ? AppColors.white : AppColors.c_5856D6,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            side: BorderSide.none,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            backgroundColor: select ? AppColors.c_5856D6 : AppColors.c_F0F3FA,
          ),
        ),
      ),
    );
  }
}
