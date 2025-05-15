class DrinkModel {

  final String image;
  final String name;
  final String title;
  final String price;
  final double? height;
  final double? width;
  final double? rightOffset;
  final double? leftOffset;

  DrinkModel({
    required this.image,
    required this.name,
    required this.title,
    required this.price,
    this.width,
    this.height,
    this.leftOffset,
    this.rightOffset,
  });

  static List<DrinkModel> icedDrinks = [

    DrinkModel(
      image: "assets/drinks/carmel.png",
      name: "Ice coffee caramel",
      title: "20 Cups of different flavours",
      price: "23",
      height: 140
    ),

    DrinkModel(
      image: "assets/drinks/ice_latte.png",
      name: "Ice latte",
      title: "3 Cups of different flavours",
      price: "40",
    ),

    DrinkModel(
      image: "assets/drinks/Salted Caramel.png",
      name: "Chocolate Drinks",
      title: "20 Cups of different flavours",
      price: "20",
    ),

    DrinkModel(
      image: "assets/drinks/Chocolate.png",
      name: "Milkshake",
      title: "20 Cups of different flavours",
      price: "10",
    ),

    DrinkModel(
      image: "assets/drinks/Strawberry.png",
      name: "Strawberry",
      title: "3 Cups of different flavours",
      price: "40",
    ),

    DrinkModel(
      image: "assets/drinks/Banana.png",
      name: "Banana",
      title: "20 Cups of different flavours",
      price: "23",
    ),

    DrinkModel(
      image: "assets/drinks/Brownie Island.png",
      name: "Brownie Island",
      title: "20 Cups of different flavours",
      price: "20",
    ),

    DrinkModel(
      image: "assets/drinks/Peanut Butter.png",
      name: "Peanut Butter",
      title: "20 Cups of different flavours",
      price: "10",
    ),


  ];static List<DrinkModel> hotDrinks = [

    DrinkModel(
      image: "assets/hotdrinks/latte.png",
      name: "Latte",
      title: "3 Cups of different flavours",
      price: "40",
      height: 130,
      width: 85

    ),

    DrinkModel(
      image: "assets/hotdrinks/espresso.png",
      name: "Espresso",
      title: "20 Cups of different flavours",
      price: "20",
      height: 130,
      width: 80
    ),

    DrinkModel(
        image: "assets/hotdrinks/hot-macchiato-coffee.png",
        name: "hot Macchiato Coffee",
        title: "3 Cups of different flavours",
        price: "40",
        height: 130,
        width: 85

    ),

    DrinkModel(
        image: "assets/hotdrinks/mocha-coffee.png",
        name: "Mocha Coffee",
        title: "3 Cups of different flavours",
        price: "40",
        height: 130,
        width: 85

    ),

    DrinkModel(
        image: "assets/hotdrinks/turkish-coffee.png",
        name: "Turkish Coffee",
        title: "3 Cups of different flavours",
        price: "40",
        height: 130,
        width: 85

    ),

    DrinkModel(
      image: "assets/hotdrinks/hot-chocolate.png",
      name: "Hot-Chocolate",
      title: "20 Cups of different flavours",
      price: "10",
      height: 130,
      width: 95

    ),

    DrinkModel(
      image: "assets/hotdrinks/rich-and-creamy.png",
      name: "Rich and Creamy",
      title: "3 Cups of different flavours",
      price: "40",
      height: 130,
      width: 95

    ),
    DrinkModel(
        image: "assets/hotdrinks/cappuccino.png",
        name: "cappuccino",
        title: "3 Cups of different flavours",
        price: "40",
        height: 130,
        width: 85

    ),

  ];
}
