import 'package:flutter/material.dart';
import 'package:mealsappproject3/meals_item.dart';
import './modals/dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
//  final String id;
//  final String categoryTitle;
//
//  CategoryMealScreen(this.id,this.categoryTitle);

  static const routeName = '/category_meal_screen';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final id = routeArgs['id'];
    final categoryMeal = DUMMY_MEALS.where((element) {
      return element.categories.contains(id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return MealsItem(
               id: categoryMeal[index].id,
                title: categoryMeal[index].title,
                duration: categoryMeal[index].duration,
                imageUrl: categoryMeal[index].imageUrl,
                complexity: categoryMeal[index].complexity,
                affordablility: categoryMeal[index].affordability);
          },
          itemCount: categoryMeal.length,
        ),
      ),
    );
  }
}
