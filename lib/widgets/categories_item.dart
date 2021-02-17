
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_meal/screens/category_meals_screen.dart';
class CategoryItem extends StatelessWidget{
  final String id;
  final String title;
  final Color color;
void selectedItem(BuildContext cntx){
  Navigator.pushNamed(cntx, CategoryMealsScreen.routeName,
  arguments:{
    'id' : id,
    'title': title,
  }
  );
}
   CategoryItem( this.id, this.title, this.color) ;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: ()=>selectedItem(context),
      child: Container(
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color
            ],
                begin: Alignment.topLeft,
            end: Alignment.bottomRight,

          )
        ),
        padding: EdgeInsets.all(15),
        child: Text(title,style: Theme.of(context).textTheme.title,),
        
      ),
    );
  }

}