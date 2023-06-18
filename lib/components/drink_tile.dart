// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../models/drink.dart';

class MyDrinkTile extends StatelessWidget {
  final Drink drink;
  void Function()? onTap;
  final Widget trailing;
  MyDrinkTile(
      {super.key,
      required this.drink,
      required this.onTap,
      required this.trailing});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            color: Colors.brown[100], borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          title: Text(drink.name),
          leading: Image.asset(drink.imagePath),
          subtitle: Text(drink.price),
          trailing: trailing,
        ),
      ),
    );
  }
}
