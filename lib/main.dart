// ignore_for_file: prefer_const_constructors

import 'package:bubble_tea_shop_app/models/shop.dart';
import 'package:bubble_tea_shop_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BubbleTeaShop(),
      builder: ((context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primarySwatch: Colors.brown, fontFamily: "Inter"),
            home: Homepage(),
          )),
    );
  }
}
