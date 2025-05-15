import 'package:flutter/material.dart';
import 'drinkcard.dart';

class ShowItems extends StatefulWidget {
  const ShowItems({super.key, required this.drinks, required this.ishot});
  final List drinks;
  final bool ishot;

  @override
  State<ShowItems> createState() => _ShowItemsState(drinks,ishot);
}

class _ShowItemsState extends State<ShowItems> {
  ScrollController controller = ScrollController();
  final List drinks;
  final bool ishot;
  _ShowItemsState(List this.drinks, bool this.ishot);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: ListView.builder(
              controller: controller,
              itemCount: drinks.length ?? 0,
              itemBuilder: (context,i){
                return AnimatedBuilder(
                  animation: controller,
                  builder: (context,child){
                    double offset = 0;
                    if(controller.hasClients){
                      offset =controller.offset/90 -i ;
                    }
                    offset = offset.clamp(0, 2);
                    return Transform.scale(
                      scale: 1-(offset*0.1),
                      child: DrinkCard(
                        image: drinks[i].image,
                        name: drinks[i].name,
                        title: drinks[i].title,
                        price: drinks[i].price,
                        height: drinks[i].height == null ? 170 : drinks[i].height!.toInt(),
                        width: drinks[i].width == null ? 90 : drinks[i].width!.toInt(),
                        ishot: ishot ?? false,
                        index: i,
                      ),
                    );
                  },
                );
              }),
        )
    );
  }
}
