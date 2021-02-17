

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_meal/models/meal.dart';
import 'package:my_meal/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id ;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
 // final Function removeItem;
String get complexityText
    {
      switch(complexity) {
        case Complexity.Simple:
          return 'simple';
          break;
        case Complexity.Challenging:
          return 'Challenging';
          break;
        case Complexity.Hard:
          return 'Hard';
          break;
        default:
          return 'Unknown';
      }
   }
  String get affordabilityText
  {
    switch(affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'Unknown';
    }
  }
  const MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
   // @required this.removeItem,
  });

  void selectedMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailScreen.routeName,arguments: id)
        .then((result) {
     // if(result!=null)removeItem(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectedMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 10,
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            Stack(

              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(imageUrl,height: 200,width: double.infinity,fit: BoxFit.fill,),
                ),
                Positioned(
                  right: 10,
                    bottom: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius:BorderRadius.circular(5),
                      ) ,
                      width: 250,
                    //  color:Colors.black26 ,
                      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                      child: Text(title,style: TextStyle(fontSize: 26,color: Colors.white),
                        overflow: TextOverflow.fade,
                        softWrap: true,
                      ),
                )),
              ],

            ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.access_time),
                    SizedBox(
                      width: 5,
                    ),
                    Text('$duration min'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.work),
                    SizedBox(
                      width: 5,
                    ),
                    Text(complexityText),
                  ],
                ),Row(
                  children: [
                    Icon(Icons.attach_money),
                    SizedBox(
                      width: 5,
                    ),
                    Text(affordabilityText),
                  ],
                ),
              ],
            ),
          )
          ],

        ),
      ),
    );
  }
}
