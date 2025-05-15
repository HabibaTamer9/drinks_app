import 'package:drinks_app/componant/hotItems.dart';
import 'package:drinks_app/componant/icedItems.dart';
import 'package:drinks_app/drinkModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Details extends StatefulWidget {
  const Details({super.key, required this.index, required this.ishot});
  final int index ;
  final bool ishot ;

  @override
  State<Details> createState() => _DetailsState(index,ishot);
}

class _DetailsState extends State<Details> {


  //ice drinks
  final drinks = DrinkModel.hotDrinks;

  //size
  List text = ["Small","Medium","Large"];
  int selected = -1 ;

  //counter
  bool isPressed = false;
  int count = 0 ;

  bool isIced = true ;

  int index = 0 ;

  _DetailsState(this.index, bool ishot){
    isIced = !ishot;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            isIced ?
            IcedItems(drinksList: DrinkModel.icedDrinks,index: index,):
            HotItems(drinksList: DrinkModel.hotDrinks,index: index,),
            //size
            Positioned(
              bottom: 100,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(3, (index) {
                  return Column(
                    children: [
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selected == index ? Colors.amber : Colors.white,
                            border: Border.all(
                              color: Colors.black,
                              width: 1
                            )
                          ),
                          height: 50,
                          width: 50,
                          child: SvgPicture.asset(
                            "assets/logo/Vector.svg",
                            color: selected == index ? Colors.white: Colors.black87,
                          ),
                        ),
                        onTap: (){
                          setState(() {
                            selected = index ;
                          });
                        },
                      ),
                      Container(
                        padding: EdgeInsets.all(6),
                        child: Text(
                          text[index],
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  );
                }),
              ),
            ),
            //count and switcher
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //switch
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2
                        ),
                      ],
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey.shade300,
                    ),

                    padding: EdgeInsets.all(4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        switcher("Hot", !isIced),
                        switcher("Iced", isIced)
                      ],
                    ),
                  ),
                  //counter
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 5
                        ),
                      ],
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: isPressed?
                    Row(
                      children: [
                        IconButton(
                          onPressed: (){
                            setState(() {
                              count--;
                              if(count==0) {
                                isPressed = false;
                              }
                            });
                          },
                          icon: Icon(Icons.remove,size: 35,)
                        ),
                        Text(
                          count.toString(),
                          style: TextStyle(fontSize: 22),),
                        IconButton(
                          onPressed: (){
                            setState(() {
                              count++;
                            });
                          },
                          icon: Icon(Icons.add,size: 35,)),
                      ],
                    ):
                    IconButton(onPressed: (){
                      setState(() {
                        count++;
                        isPressed = true ;
                      });
                    }, icon: Icon(Icons.add,size: 35,)),

                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
  Widget switcher(String label , bool isiced){
    return GestureDetector(
      onTap: (){
        setState(() {
          isIced = label == "Iced";
        });
      },
      child: AnimatedContainer(
        curve: Curves.easeIn,
        duration: Duration(microseconds: 800),
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: !isiced ? Colors.grey.shade300:Colors.white,
        ),
        child: Text(
            label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
