import 'package:flamesdeliveryapps/models/food.dart';
import 'package:flutter/material.dart';


class MyTabBar extends StatelessWidget {
  final TabController tabController;

  const MyTabBar({
    super.key,
    required this.tabController,
  });

  // Function to build category tabs dynamically based on FoodCategory enum
  List<Tab> buildCategoryTabs() {
    return FoodCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last, // Get the category name (e.g., pizzas)
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: TabBar(
        controller: tabController,
        tabs: buildCategoryTabs(), // Use the dynamically generated category tabs
      ),
    );
  }
}
