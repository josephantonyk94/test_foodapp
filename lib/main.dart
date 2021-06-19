import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_food_app/model/api/restaurent.dart';
import 'package:test_food_app/screens/home.dart';
import 'package:test_food_app/screens/login.dart';

import 'model/cart.dart';
import 'model/restaurant_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(
        providers: [
          //ChangeNotifierProvider(create: (context) => RestaurentList()),
          ChangeNotifierProvider<Cart>(create: (context) => Cart()),
          FutureProvider<List<TableMenu>>(
            create: (context) => RestaurantProvider().getRestaurant(),
            initialData: [],
          )
        ],
        child: HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
