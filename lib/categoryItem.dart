import 'package:flutter/material.dart';
import 'package:mealsappproject3/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  CategoryItem(this.title, this.color, this.id);

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealScreen.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: () => selectMeal(context),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
      ),
    );
  }
}
