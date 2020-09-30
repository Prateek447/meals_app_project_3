import 'package:flutter/material.dart';
import 'package:mealsappproject3/meals_item.dart';
import 'package:mealsappproject3/modals/meals.dart';

class FavoriteScreen extends StatelessWidget {

  final List<Meal> favoriteMeal;

  FavoriteScreen(this.favoriteMeal);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeal.isEmpty) {
      return Center(child: Text('Favorite list is empty'));
    }
    else{
       return ListView.builder(
         itemBuilder: (context, index) {
           return MealsItem(
               id: favoriteMeal[index].id,
               title: favoriteMeal[index].title,
               duration: favoriteMeal[index].duration,
               imageUrl: favoriteMeal[index].imageUrl,
               complexity: favoriteMeal[index].complexity,
               affordablility: favoriteMeal[index].affordability);
         },
         itemCount: favoriteMeal.length,
       );
    }
  }
}
