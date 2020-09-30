import 'package:flutter/material.dart';
import 'package:mealsappproject3/filters.dart';
import 'package:mealsappproject3/meals_detail_screeen.dart';
import 'package:mealsappproject3/modals/dummy_data.dart';
import 'package:mealsappproject3/modals/meals.dart';
import 'package:mealsappproject3/modals/tabs_screen.dart';
import './category_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String,bool> _filters = {
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegeterian': false,
  };

   List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData){
     setState(() {
       _filters=filterData;

       _availableMeals.where((element) {
         if(_filters['gluten'] && !element.isGlutenFree) {
           return false;
         }
         if(_filters['lactose'] && !element.isLactoseFree) {
           return false;
         }
         if(_filters['vegan'] && !element.isVegan) {
           return false;
         }
         if(_filters['vegeterian'] && !element.isVegiteriaan) {
           return false;
         }
         return true;
       }).toList();
     });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
          headline6: TextStyle(fontSize: 24,fontFamily: 'RobotoCondensed',fontWeight: FontWeight.bold),

            ),
      ),
      home:TabsScreen(),
     // initialRoute: '/',
      routes: {
       // '/':(ctx) => TabsScreen(),
        TabsScreen.routeName:(ctx) => TabsScreen(),
        Filters.routeName:(ctx) => Filters(_filters,_setFilters),
        CategoryMealScreen.routeName: (ctx) =>CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName:(ctx) => MealDetailScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
