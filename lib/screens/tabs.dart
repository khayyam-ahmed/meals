import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Screens
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filter.dart';
import 'package:meals/screens/meals.dart';

//Widgets
import 'package:meals/widgets/main_drawer.dart';

// Providers
import 'package:meals/providers/meals_provider.dart';
import 'package:meals/providers/favorites_provider.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  var _appBarTitle = 'Categories';

  void onSelectNavBarItem(int index) {
    setState(() {
      _selectedPageIndex = index;
      if (index == 1) {
        _appBarTitle = 'Your  Favorites';
      } else {
        _appBarTitle = 'Categories';
      }
    });
  }

  void _onSelectScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => const FilterScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    var filteredMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CategoriesScreen(
      availableMeals: filteredMeals,
    );

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favouriteMealsProvider);
      activePage = MealsScreen(meals: favoriteMeals);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _onSelectScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: onSelectNavBarItem,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
