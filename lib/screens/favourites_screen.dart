import 'package:flutter/material.dart';
import 'package:my_meal/models/meal.dart';
import 'package:my_meal/widgets/meal_item.dart';
class favourite extends StatefulWidget {
  List<Meal> favouritMeal;
  favourite(this.favouritMeal);
  @override
  _favouriteState createState() => _favouriteState();
}

class _favouriteState extends State<favourite> {
  @override
  Widget build(BuildContext context) {
    if(widget.favouritMeal.isEmpty)
    return Center(
      child: Text('ther is no favourites :)'),
    );
    else{
      return ListView.builder(
        itemBuilder: (BuildContext ctx, index) {
          return MealItem(
            title: widget.favouritMeal[index].title,
            complexity: widget.favouritMeal[index].complexity,
            affordability: widget.favouritMeal[index].affordability,
            duration: widget.favouritMeal[index].duration,
            imageUrl: widget.favouritMeal[index].imageUrl,
            id: widget.favouritMeal[index].id,
           // removeItem: removeMeal,
          );
        }, //
        itemCount: widget.favouritMeal.length,
      );
    }
  }
}
