import 'package:flutter/material.dart';
import 'package:mealsappproject3/filters.dart';
import 'package:mealsappproject3/meals_detail_screeen.dart';
import 'package:mealsappproject3/modals/tabs_screen.dart';
import './categories_screen.dart';
import './category_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        Filters.routeName:(ctx) => Filters(),
        CategoryMealScreen.routeName: (ctx) =>CategoryMealScreen(),
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
