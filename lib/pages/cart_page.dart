// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/drink_tile.dart';
import '../models/drink.dart';
import '../models/shop.dart';

class CartPage extends StatefulWidget {
  CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeDrinkFromCart(Drink drink) {
    Provider.of<BubbleTeaShop>(context, listen: false).removeFromCart(drink);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // heading
              Text(
                "YOUR CART",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),

              // list of Drinks for sale
              Expanded(
                  child: ListView.builder(
                      itemCount: value.userCart.length,
                      itemBuilder: (context, index) {
                        Drink drinkItem = value.userCart[index];
                        return MyDrinkTile(
                          drink: drinkItem,
                          trailing: Icon(
                            Icons.remove_circle_outline_outlined,
                            color: Color.fromARGB(255, 255, 41, 25),
                          ),
                          onTap: () => removeDrinkFromCart(drinkItem),
                        );
                      })),
              SizedBox(
                height: 20,
              ),

              MaterialButton(
                color: Colors.brown[500],
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textColor: Colors.white,
                onPressed: () {},
                child: Text("PAY"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
