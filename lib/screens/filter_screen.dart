import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_meal/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static String routeName = 'filterScreen';
  Function saveFilter;
  Map <String ,bool> currentFilter ;


  FilterScreen(this.currentFilter,this.saveFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
   bool GlutenFree=false;

   bool LactoseFree=false;

   bool VeganFree=false;

   bool VegetarianFree=false;


   @override
   initState(){
     GlutenFree = widget.currentFilter['gluten'];
     LactoseFree = widget.currentFilter['lactose'];
     VeganFree = widget.currentFilter['vegan'];
     VegetarianFree = widget.currentFilter['vegetarian'];
     super.initState();
   }

   Widget BuildSwitchTile(String title,String subtitle,bool sValue,Function updateValue){
     return SwitchListTile(

       value: sValue,
        title: Text(title),
        subtitle:Text(subtitle) ,
        onChanged: updateValue,
     );
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('your Filters'),
      actions: [
       IconButton(icon: Icon(Icons.save), onPressed:(){
         Map <String ,bool> selectedMeals = {
           'gluten' : GlutenFree,
           'vegan' : VeganFree,
           'vegetarian' : VegetarianFree,
           'lactose' : LactoseFree,
         };
         widget.saveFilter(selectedMeals);
       } ) ,

      ],
      ),
     body:Column(
       children: [
         Container(
           padding: EdgeInsets.all(20),
           child: Center(child: Text('Adjust your meal selection.',style: Theme.of(context).textTheme.title,)),
         ),
         BuildSwitchTile("Gluten", "meal have a gluten", GlutenFree, (newValue){
          setState(() {
            GlutenFree = newValue;
          });
         }),
         BuildSwitchTile("Lactose", "meal have a Lactose", LactoseFree, (newValue){
           setState(() {
             LactoseFree = newValue;
           });
         }),
         BuildSwitchTile("vegan", "meal have a vegan", VeganFree, (newValue){
           setState(() {
             VeganFree = newValue;
           });
         }),
         BuildSwitchTile("vegetarian", "meal have a vegetarian", VegetarianFree, (newValue){
           setState(() {
             VegetarianFree = newValue;
           });
         }),
       ],
     ),
      drawer: MAinDrawe(),
    );
  }
}
