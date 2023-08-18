import 'package:flutter/material.dart';

import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meals_grid_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => MealGridItem(meal: meals[index]),
      ),
      // GridView(
      //   padding: const EdgeInsets.all(15),
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     childAspectRatio: 3 / 2,
      //     crossAxisSpacing: 20,
      //     mainAxisSpacing: 20,
      //   ),
      //   children: meals.map((meal) => MealGridItem(meal: meal)).toList(),
      // ),
    );
  }
}
