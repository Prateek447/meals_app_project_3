import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealsappproject3/modals/dummy_data.dart';

import 'categoryItem.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar( title: const Text("DeliMeals"),),
      body: GridView(
        padding: EdgeInsets.all(10),
        children: DUMMY_CATEGORIES
            .map((category) => CategoryItem(category.title, category.color,category.id))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20
        ),
      ),
    );
  }
}
