import 'package:flutter/material.dart';
import 'package:mealsappproject3/mainDrawer.dart';

class Filters extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String,bool> currentFilters;

  Filters(this.currentFilters,this.saveFilters);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var _glutenFree = false;
  var _vegeterian = false;
  var _vegan = false;
  var _lactoseFree = false;

    @override
    initState(){
      _glutenFree = widget.currentFilters['gluten'];
      _vegeterian = widget.currentFilters['vegeterian'];
      _vegan = widget.currentFilters['vegan'];
      _lactoseFree = widget.currentFilters['lactose'];
      super.initState();
    }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: [
            IconButton(icon: Icon(Icons.save), onPressed:(){
              Map<String,bool> selectedFilters = {
                'gluten':_glutenFree,
                'lactose':_lactoseFree,
                'vegan':_vegan,
                'vegeterian': _vegeterian,
              };
              widget.saveFilters(selectedFilters);
            } ),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                      'Gluten-Free', 'Only-add-Gluten-Free-Meal', _glutenFree,
                      (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),
                  _buildSwitchListTile(
                      'Vegeterian', 'Only-add-Vegeterian-Meal', _vegeterian,
                      (newValue) {
                    setState(() {
                      _vegeterian = newValue;
                    });
                  }),
                  _buildSwitchListTile('Vegan', 'Only-add-Vegan-Meal', _vegan,
                      (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
                  _buildSwitchListTile('Lactose-Free',
                      'Only-add-Lactose-Free-Meal', _lactoseFree, (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  })
                ],
              ),
            ),
          ],
        ));
  }
}
