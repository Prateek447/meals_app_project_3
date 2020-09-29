import 'package:flutter/material.dart';
import 'package:mealsappproject3/meals_item.dart';
import 'package:mealsappproject3/modals/meals.dart';
import './modals/dummy_data.dart';

class CategoryMealScreen extends StatefulWidget {
//  final String id;
//  final String categoryTitle;
//
//  CategoryMealScreen(this.id,this.categoryTitle);

  static const routeName = '/category_meal_screen';

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _initData=false;


  @override
  void didChangeDependencies() {
    if(!_initData){
      final routeArgs =
      ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final id = routeArgs['id'];
      displayedMeals = DUMMY_MEALS.where((element) {
        return element.categories.contains(id);
      }).toList();
      _initData=true;
    }
    super.didChangeDependencies();
  }

  void removeMeal(String mealId){
    setState(() {
      displayedMeals.where((meal) => meal.id==mealId );
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return MealsItem(
              removeItem: removeMeal,
               id: displayedMeals[index].id,
                title: displayedMeals[index].title,
                duration: displayedMeals[index].duration,
                imageUrl: displayedMeals[index].imageUrl,
                complexity: displayedMeals[index].complexity,
                affordablility: displayedMeals[index].affordability);
          },
          itemCount: displayedMeals.length,
        ),
      ),
    );
  }
}
