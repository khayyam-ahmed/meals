import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealGridItem extends StatelessWidget {
  const MealGridItem({super.key, required this.meal});
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      splashColor: Theme.of(context).primaryColor,
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          // image: DecorationImage(image: ),
        ),
        child: Text(
          meal.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
