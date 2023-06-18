import 'package:bubble_tea_shop_app/models/drink.dart';
import 'package:flutter/material.dart';

class BubbleTeaShop extends ChangeNotifier {
  // LIST OF DRINKS FOR SALE
  final List<Drink> _shop = [
    Drink(
        name: "Pearl Milk Tea",
        price: "4.00",
        imagePath: "lib/assets/pearl-milk.png"),
    Drink(
        name: "Classic Bubble Tea",
        price: "5.40",
        imagePath: "lib/assets/classic-bubble-tea.png"),
    Drink(
        name: "Taro Milk Tea",
        price: "5.20",
        imagePath: "lib/assets/taro-milk-tea.png"),
    Drink(
        name: "Green Tea",
        price: "6.00",
        imagePath: "lib/assets/green-tea.png"),
    Drink(
        name: "Cream Tea",
        price: "7.40",
        imagePath: "lib/assets/cream-tea.png"),
    Drink(
        name: "Choco Tea",
        price: "5.50",
        imagePath: "lib/assets/choco-tea.png"),
  ];

  // LIST OF DRINKS IN USER'S CART
  final List<Drink> _userCart = [];

  //get DRINKS FOR SALE
  List<Drink> get shop => _shop;

  //get USER CART
  List<Drink> get userCart => _userCart;

  //add DRINK TO CART
  void addToCart(Drink drink) {
    _userCart.add(drink);
    notifyListeners();
  }

  //remove DRINK from CART
  void removeFromCart(Drink drink) {
    _userCart.remove(drink);
    notifyListeners();
  }
}
