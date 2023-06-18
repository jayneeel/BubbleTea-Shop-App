// ignore_for_file: prefer_const_constructors

import 'package:bubble_tea_shop_app/models/drink.dart';
import 'package:bubble_tea_shop_app/models/shop.dart';
import 'package:bubble_tea_shop_app/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;
  const OrderPage({super.key, required this.drink});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  double sweetValue = 0.5;
  double iceValue = 0.4;
  double pearlValue = 0.6;

  void customizeSweetness(double value) {
    setState(() {
      sweetValue = value;
    });
  }

  void customizeIce(double value) {
    setState(() {
      iceValue = value;
    });
  }

  void customizePearls(double value) {
    setState(() {
      pearlValue = value;
    });
  }

  // ADD TO CART
  void addToCart() {
    Provider.of<BubbleTeaShop>(context, listen: false).addToCart(widget.drink);

    Navigator.pop(context);

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Successfully Added to cart!"),
            ));
  }

  var textStyleCustom =
      TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w700, fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text(widget.drink.name),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          Image.asset(widget.drink.imagePath),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // SWEETNESS
                    SizedBox(
                        width: 70,
                        child: Text(
                          "Sweet",
                          style: textStyleCustom,
                        )),
                    Expanded(
                      child: Slider(
                        value: sweetValue,
                        label: sweetValue.toString(),
                        onChanged: ((value) => customizeSweetness(value)),
                        divisions: 4,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // ICE
                    SizedBox(
                        width: 90,
                        child: Text(
                          "Ice",
                          style: textStyleCustom,
                        )),
                    Expanded(
                      child: Slider(
                        value: iceValue,
                        label: iceValue.toString(),
                        onChanged: ((value) => customizeIce(value)),
                        divisions: 4,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // SWEETNESS
                    SizedBox(
                        width: 70,
                        child: Text(
                          "Pearls",
                          style: textStyleCustom,
                        )),
                    Expanded(
                      child: Slider(
                        value: pearlValue,
                        label: pearlValue.toString(),
                        onChanged: ((value) => customizePearls(value)),
                        divisions: 4,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                MaterialButton(
                  color: Colors.brown,
                  textColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  child: Text("Add to Cart"),
                  onPressed: () => addToCart(),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
