import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_meal/screens/filter_screen.dart';
import 'package:my_meal/screens/tap_screen.dart';
class MAinDrawe extends StatelessWidget {
  Widget BuildTile(Function x,String title,IconData icon){
    return  ListTile(
      leading: Icon(icon,size: 24,),
      onTap: x,
      title: Text(title,style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoCondensed',
      ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(35),
            alignment: AlignmentDirectional.centerStart,
            width: double.infinity,
            height: 150,
            color: Theme.of(context).accentColor,
            child: Text('Cooking up!',style: TextStyle(
              color: Colors.redAccent,
              fontSize: 35,
              fontWeight:  FontWeight.bold,
            ),),
          ),
          SizedBox(height: 20,),
          BuildTile((){Navigator.of(context).pushReplacementNamed('/');}, 'Meal', Icons.restaurant),
          SizedBox(height: 20,),
          BuildTile((){Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);}, 'Filter', Icons.settings),
        ],
      ),
    );
  }
}
