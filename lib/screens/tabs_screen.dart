import 'package:flutter/material.dart';
import 'package:receitasapp/models/meal.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';
import 'package:receitasapp/components/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritesMeals;

  const TabsScreen(this.favoritesMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedCreenIndex = 0;

  final List<String> _titles = [
    'Lista de Categorias',
    'Meus Favoritos',
  ];

  List<Widget>? _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      CategoriesScreen(),
      FavoriteScreen(widget.favoritesMeals),
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedCreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedCreenIndex]),
        centerTitle: true,
      ),
      drawer: MainDrawer(),
      body: _screens![_selectedCreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedCreenIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
