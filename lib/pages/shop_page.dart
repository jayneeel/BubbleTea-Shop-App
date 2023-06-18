import 'package:bubble_tea_shop_app/components/drink_tile.dart';
import 'package:bubble_tea_shop_app/models/shop.dart';
import 'package:bubble_tea_shop_app/pages/order_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/drink.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // USER SELECTED A DRINK
  void goToOrderPage(Drink drink) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OrderPage(
                  drink: drink,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // heading
              Text(
                "BUBBLE TEA SHOP",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.white, fontSize: 20, fontFamily: "Inter"),
              ),
              SizedBox(
                height: 20,
              ),

              // list of Drinks for sale
              Expanded(
                  child: ListView.builder(
                      itemCount: value.shop.length,
                      itemBuilder: (context, index) {
                        Drink drinkItem = value.shop[index];
                        return MyDrinkTile(
                          drink: drinkItem,
                          trailing: Icon(Icons.arrow_forward),
                          onTap: () => goToOrderPage(drinkItem),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
