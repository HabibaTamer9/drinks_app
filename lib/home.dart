import 'package:drinks_app/drinkModel.dart';
import 'package:drinks_app/showitems.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: TabBarView(
          children:[ 
            ShowItems(drinks: DrinkModel.icedDrinks ?? [],ishot: false,),
            ShowItems(drinks: DrinkModel.hotDrinks ?? [],ishot: true,)
          ]
        ),
        bottomNavigationBar: TabBar(
          //padding: EdgeInsets.all(8),
          indicatorColor: Colors.black,
          labelStyle: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),
          unselectedLabelStyle: TextStyle(color: Colors.black87),

          tabs: [
            Tab(
              child: Text("Iced"),
            ),
            Tab(
              child: Text("Hot"),
            )
        ]),
      ),
    );
  }
}
