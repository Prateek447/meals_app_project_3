import 'package:flutter/foundation.dart';

enum Complexity { Simple, Challenging, Hard }

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final String title;
  final String imageUrl;
  final List<String> categories;
  final List<String> ingrediants;
  final List<String> steps;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegiteriaan;
  final Complexity complexity;
  final Affordability affordability;

 const Meal(
      {@required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.categories,
      @required this.affordability,
      @required this.complexity,
      @required this.duration,
      @required this.ingrediants,
      @required this.isGlutenFree,
      @required this.isLactoseFree,
      @required this.isVegan,
      @required this.isVegiteriaan,
      @required this.steps});
}
