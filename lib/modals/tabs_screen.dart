import 'package:flutter/material.dart';
import 'package:mealsappproject3/categories_screen.dart';
import 'package:mealsappproject3/favorite_screen.dart';
import 'package:mealsappproject3/mainDrawer.dart';
import 'package:mealsappproject3/modals/meals.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabScreen';

  List<Meal> favoriteMeal;

  TabsScreen(this.favoriteMeal);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoryScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoriteScreen(widget.favoriteMeal),
        'title': 'Your Favorite',
      }
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: Drawer(child: MainDrawer()),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.cyanAccent,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}
