import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_food_app/model/api/restaurent.dart';
import 'package:test_food_app/model/cart.dart';

class DishCard extends StatelessWidget {
  const DishCard({Key? key, required this.index, required this.tableMenu})
      : super(key: key);

  final int index;
  final TableMenu tableMenu;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Image.asset(
              tableMenu.categoryDishes[index].dishType == 2
                  ? 'assets/pngkey.com-veg-icon-png-2619381.png'
                  : 'assets/pngkey.com-veg-biryani-png-2459071.png',
              height: 15,
              width: 15,
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 230,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "${tableMenu.categoryDishes[index].dishName}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "${tableMenu.categoryDishes[index].dishPrice}",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      "${tableMenu.categoryDishes[index].dishCalories} calories",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Container(
                  width: 230,
                  child: Column(
                    children: [
                      Text("$tableMenu.categoryDishes[index].dishDescription}"),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.green.shade400),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          context
                              .read<Cart>()
                              .addToCart(tableMenu.categoryDishes[index]);
                        },
                      ),
                      Consumer<Cart>(
                        builder: (_, val, __) => Text(
                          val.cartList
                              .map((e) =>
                                  e.dishId ==
                                  tableMenu.categoryDishes[index].dishId)
                              .toList()
                              .length
                              .toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.remove, color: Colors.white),
                        onPressed: () {
                          context
                              .read<Cart>()
                              .removeFromCart(tableMenu.categoryDishes[index]);
                        },
                      ),
                    ],
                  ),
                ),
                tableMenu.categoryDishes[index].addonCat.isNotEmpty
                    ? Container(
                        child: Text(
                          "Customizations Available",
                          style:
                              TextStyle(color: Colors.redAccent, fontSize: 18),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
          Container(
            child: Image.network(
              "http://restaurants.unicomerp.net//images/Restaurant/1010000001/Item/Items/100000001.jpg",
              height: 110,
              width: 90,
            ),
          )
        ],
      ),
    );
  }
}
