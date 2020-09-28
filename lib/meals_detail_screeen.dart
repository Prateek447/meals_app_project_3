import 'package:flutter/material.dart';
import 'package:mealsappproject3/modals/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';


  Widget buildSectionTitle(BuildContext context, String text) {
  return Container(
  margin: EdgeInsets.symmetric(vertical: 10),
  child: Text(
  text,
  style: Theme.of(context).textTheme.title,
  ),
  );
  }

  Widget buildContainer(Widget child) {
  return Container(
  decoration: BoxDecoration(
  color: Colors.white,
  border: Border.all(color: Colors.grey),
  borderRadius: BorderRadius.circular(10),
  ),
  margin: EdgeInsets.all(10),
  padding: EdgeInsets.all(10),
  height: 150,
  width: 300,
  child: child,
  );
  }



  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Colors.purple,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(selectedMeal.ingrediants[index],style: TextStyle(color: Colors.white),)),
                ),
                itemCount: selectedMeal.ingrediants.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(backgroundColor: Colors.purple,
                        child: Text('# ${(index + 1)}',style: TextStyle(color: Colors.white),),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider()
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
