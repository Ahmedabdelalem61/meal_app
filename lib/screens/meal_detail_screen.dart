import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_meal/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static String routeName = 'MealDetailScreen';
   Function favToggle;
   Function isFavMeal;


  MealDetailScreen(this.favToggle,this.isFavMeal);

  Widget buildTextContainer(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildListContainer(Widget child) {
    return Container(
      width: 300,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context).settings.arguments as String;
    var selectedMeal = DUMMY_MEALS.firstWhere((meal) => mealid == meal.id);
    print(selectedMeal.ingredients[0]);
    print(selectedMeal.ingredients[2]);
    print(selectedMeal.ingredients[3]);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildTextContainer(context, 'Ingredints'),
            buildListContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildTextContainer(context, 'Steps'),
            buildListContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(selectedMeal.imageUrl),
                        backgroundColor: Colors.transparent,
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> favToggle(mealid),
        child: Icon(
          isFavMeal(mealid)?Icons.star:Icons.star_border,
        ),
      ),
    );
  }
}
