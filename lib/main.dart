
import 'package:flutter/material.dart';
import 'package:my_meal/dummy_data.dart';
import 'package:my_meal/models/meal.dart';
import 'package:my_meal/screens/category_screen.dart';
import 'package:my_meal/screens/filter_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tap_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map <String ,bool> _filters = {
    'gluten' : false,
    'vegan' : false,
    'vegetarian' : false,
    'lactose' : false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouritMeal =[];
  void FavToggle(String maelId){
    int mealExistedIndex = _favouritMeal.indexWhere((meal) =>meal.id==maelId );
    if(mealExistedIndex>=0){
    setState(() {
      _favouritMeal.removeAt(mealExistedIndex);
    });
    }
    else
      {
        setState(() {
          _favouritMeal.add(DUMMY_MEALS.firstWhere((meal) =>meal.id==maelId ));
        });
      }


  }
  bool isFavouriteMeal(String id){
    return _favouritMeal.any((meal) => meal.id==id);
  }
  void _setfilters(Map <String ,bool> filtersData){
    //every click save setfilter receive filterdata and send it to filter to reset the state
    setState(() {
      _filters=filtersData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if(_filters['gluten'] && !meal.isGlutenFree)
          return false;
        if(_filters['lactose'] && !meal.isLactoseFree)
          return false;
        if(_filters['vegetarian'] && !meal.isVegetarian)
          return false;
        if(_filters['vegan'] && !meal.isVegan)
          return false;
        return true;
      }).toList();
    });

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      theme: ThemeData(
        primaryColor: Colors.pinkAccent,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
              title:TextStyle(
                fontFamily:'RobotoCondensed' ,
                fontSize:20 ,
                fontWeight: FontWeight.bold,
              )
            ),

      ),
     // home: MyHomePage(),
      //home: CategoryScreen(),
      routes:
      {
        '/':(context)=>TabsScreen(_favouritMeal),
        CategoryMealsScreen.routeName:(context) =>CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName:(context)=>MealDetailScreen(FavToggle,isFavouriteMeal),
        FilterScreen.routeName:(context)=>FilterScreen(_filters,_setfilters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal App'),
      ),
      body: null,
    );
  }
}
