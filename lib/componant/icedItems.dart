import 'package:flutter/material.dart';

class IcedItems extends StatefulWidget {
  const IcedItems({super.key, required this.drinksList, required this.index});
  final List drinksList;
  final int index ;

  @override
  State<IcedItems> createState() => _IcedItemsState(drinksList, index);
}

class _IcedItemsState extends State<IcedItems> {
  //items
  List drinks=[];
  double currentPage =0;
  _IcedItemsState(List drinksList,int index){
    drinks = drinksList;
    currentPage= index.toDouble() ;
  }

  //animation
   PageController controller = PageController(viewportFraction: 0.5);

  @override
  void initState() {
    controller = PageController(initialPage: currentPage.toInt(), viewportFraction: 0.5);
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
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: PageView.builder(
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemCount: drinks.length,
            itemBuilder: (context, i) {
              final scale = 1 - (currentPage - i).abs() * 1;
              final transY = (currentPage - i ).abs() *320 ;
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
                            bottom: -8,
                            right: 0,
                            left: 5,
                            child: Image.asset("assets/drinks/Ellipse 2.png"),
                            // child: Container(
                            //   height: 10,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(100),
                            //     boxShadow: [
                            //       BoxShadow(
                            //           color: Colors.grey.shade900,
                            //           spreadRadius: 10,
                            //           blurRadius: 60
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
                            fit: BoxFit.cover,
                            height: 360,
                            width: 500,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
