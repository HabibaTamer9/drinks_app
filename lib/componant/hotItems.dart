import 'package:flutter/material.dart';

class HotItems extends StatefulWidget {

  const HotItems({super.key, required this.drinksList, required this.index});
  final List drinksList;
  final int index;

  @override
  State<HotItems> createState() => _HotItemsState(drinksList, index);
}

class _HotItemsState extends State<HotItems> {
  //items
  List drinks=[];
  double currentPage =0;
  _HotItemsState(List drinksList, int index){
    currentPage = index.toDouble() ;
    drinks = drinksList;
  }

  //animation
   PageController controller = PageController(viewportFraction: 0.7);

  @override
  void initState() {
    controller = PageController(initialPage: currentPage.toInt(), viewportFraction: 0.7);
    controller.addListener((){
      setState(() {
        currentPage = controller.page ?? 1 ;
      });
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //details
        Positioned(
            top: 10,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      drinks[currentPage.round()].name,
                      style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      drinks[currentPage.round()].title,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Text(
                  "£${drinks[currentPage.round()].price}",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            )
        ),
        //image
        PageView.builder(
          controller: controller,
          scrollDirection: Axis.horizontal,
          itemCount: drinks.length,
          itemBuilder: (context, i) {
            final scale = 1 - (currentPage - i).abs() * 1;
            final transY = (currentPage - i ).abs() *450 ;
            return Transform.translate(
              offset: Offset(transY, 0),
              child: Transform.scale(
                scale: scale.clamp(0.5, 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Positioned(
                          bottom: 15,
                          right: 20,
                          left: 20,
                          child: Image.asset("assets/drinks/Ellipse 2.png"),
                          // child: Container(
                          //   height: 8,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(100),
                          //     boxShadow: [
                          //       BoxShadow(
                          //           color: Colors.grey.shade900,
                          //           spreadRadius: 2,
                          //           blurRadius: 40
                          //       )
                          //     ],
                          //   ),
                          //   // child: Image.asset(
                          //   //   "assets/drinks/shadow.png",
                          //   //   fit: BoxFit.fill,
                          //   // ),
                          // ),
                        ),
                        Image.asset(
                          drinks[i].image,
                          fit: BoxFit.contain,
                          height: 250,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
