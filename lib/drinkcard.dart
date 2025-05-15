import 'package:drinks_app/details.dart';
import 'package:flutter/material.dart';

class DrinkCard extends StatelessWidget {
  const DrinkCard({
    super.key,
    required this.image,
    required this.name,
    required this.title,
    required this.price,
    required this.height,
    required this.width,
    required this.ishot,
    required this.index
  });

  final String image;
  final String name;
  final String title;
  final String price;
  final int height;
  final int width;
  final bool ishot;
  final int index;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Text
        Container(
          margin: EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 35),
          child: Card(
            elevation: 3,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
              child: SizedBox(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30,bottom: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),
                            ),
                            Text(
                              title,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
              ),
            ),
          ),
        ),
        //image
        ishot ?
        Positioned(
          top: -40,
          bottom: 50,
          left: 10,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0,right: 8,left: 8,bottom: 5),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  bottom: 22,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                      "assets/drinks/Ellipse 2.png",
                    ),
                  // child: Container(
                  //
                  //   width: 60,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(100),
                  //     boxShadow: [
                  //       BoxShadow(
                  //           color: Colors.grey.shade900,
                  //           spreadRadius: 4,
                  //           blurRadius: 28
                  //       )
                  //     ],
                  //   ),
                    // child: Image.asset(
                    //   "assets/drinks/shadow.png",
                    //   fit: BoxFit.fill,
                    // ),
                 // ),
                ),
                Image.asset(
                  image,
                  width: width.toDouble(),
                  fit: BoxFit.contain,
                  height: height.toDouble(),
                ),

              ],
            ),
          ),
        ):
        Positioned(
          top: -42,
          bottom: 38,
          left: 5,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0,right: 8,left: 8,bottom: 5),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                      "assets/drinks/shadow.png",
                      fit: BoxFit.fill,
                    ),
                  // child: Container(
                  //   height: 9,
                  //   width: 70,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(100),
                  //     boxShadow: [
                  //       BoxShadow(
                  //           color: Colors.grey.shade900,
                  //           spreadRadius: 1.5,
                  //           blurRadius: 30
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
                  image,
                  width: width.toDouble(),
                  fit: BoxFit.contain,
                  height: height.toDouble(),
                ),

              ],
            ),
          ),
        ),
        //icon button
        Positioned(
            height: 36,
            width: 36,
            right: 30,
            top: 120,
            child: Container(

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Colors.black45,width: 2)
              ),
              child: IconButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Details(index: index,ishot: ishot,)));
                  },
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Colors.black54,
                    size: 18,
                  )
              ),
            )
        )
      ],
    );
  }
}
