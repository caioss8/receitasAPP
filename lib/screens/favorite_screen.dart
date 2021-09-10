import 'package:flutter/material.dart';
import 'package:receitasapp/components/meal_item.dart';
import 'package:receitasapp/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoritesMeals;

  const FavoriteScreen(this.favoritesMeals);

  @override
  Widget build(BuildContext context) {
    if (favoritesMeals.isEmpty) {
      return Center(
        child: Text('Nenhuma refeição foi marcada como favorita!'),
      );
    } else {
      return ListView.builder(
          itemCount: favoritesMeals.length,
          itemBuilder: (ctx, index) {
            return MealItem(favoritesMeals[index]);
          });
    }
  }
}
