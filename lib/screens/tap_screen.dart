import 'package:flutter/material.dart';
import 'package:my_meal/models/meal.dart';
import 'favourites_screen.dart';
import 'category_screen.dart';
import 'package:my_meal/widgets/main_drawer.dart';
class TabsScreen extends StatefulWidget {
  final String routeName = 'mainScreen';
   List<Meal> favouritMeal;
  TabsScreen(this.favouritMeal);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int currentIndex=0;
  List<Map<String,Object>> pages ;
  @override
  void initState() {
    pages = [
    {'title':'Categories','page':CategoryScreen()},
    {'title':'Favourite','page':favourite(widget.favouritMeal)},
    ];
    super.initState();
  }
  void _selectedItem(int index){
    setState(() {
      currentIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text( pages[currentIndex]['title']),
      ),
      body: pages[currentIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white ,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex:currentIndex,
        onTap: _selectedItem,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.category),
              label: "Categories",

          ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),
            label: "favorites",
          ),
        ],
      ),
      drawer: MAinDrawe(),
    );
  }
}

