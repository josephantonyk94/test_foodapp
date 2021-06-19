import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_food_app/model/cart.dart';
import 'package:test_food_app/screens/order_summery.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      IconButton(
        icon: Icon(
          Icons.shopping_cart,
          size: 30,
        ),
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider<Cart>(
                create: (context) => Cart(), child: OrderSummery()))),
      ),
      Positioned(
        right: 5,
        top: 5,
        child: Container(
          height: 20,
          width: 20,
          child: Consumer<Cart>(
            builder: (cntxt, val, ___) => Text(
              val.cartList.length.toString(),
            ),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.redAccent,
          ),
        ),
      )
    ]);
  }
}
