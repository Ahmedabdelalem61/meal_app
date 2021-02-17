import 'package:flutter/material.dart';
import 'package:my_meal/dummy_data.dart';
import 'package:my_meal/models/meal.dart';
import 'package:my_meal/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static String routeName = 'CategoryMealsScreen';
  List<Meal> _availableMeals;
  CategoryMealsScreen(this._availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> CategoryDispaly;
  @override
  void didChangeDependencies() {
    final routeArg =
    ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    categoryTitle = routeArg['title'];
    //categoryMeals reorder objects related to condition here that is like meal down and put it into list
    CategoryDispaly = widget._availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }
  void removeMeal(String mealId){
    setState(() {
      CategoryDispaly.removeWhere((meal) => mealId==meal.id);
    });
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      //Build context by list view builder by its index and context from the data comming from the list of string
      body: ListView.builder(
        itemBuilder: (BuildContext ctx, index) {
          return MealItem(
            title: CategoryDispaly[index].title,
            complexity: CategoryDispaly[index].complexity,
            affordability: CategoryDispaly[index].affordability,
            duration: CategoryDispaly[index].duration,
            imageUrl: CategoryDispaly[index].imageUrl,
            id: CategoryDispaly[index].id,
           // removeItem: removeMeal,
          );
        }, //
        itemCount: CategoryDispaly.length,
      ),
    );
  }
}
