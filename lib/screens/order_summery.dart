import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_food_app/model/cart.dart';

class OrderSummery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.grey),
          title: Text(
            "Order Summary",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Card(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.green.shade800,
                        ),
                        width: double.maxFinite,
                        child: Consumer<Cart>(
                          builder: (context, val, _) {
                            return Text(
                              "${val.cartList.toSet().toList().length} Dishes - ${val.cartList.length} Items",
                              style: TextStyle(color: Colors.white),
                            );
                          },
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: Consumer<Cart>(
                          builder: (context, val, _) => ListView.builder(
                              itemCount: val.cartList.toSet().toList().length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(8),
                                            child: Image.asset(
                                              'assets/pngkey.com-veg-biryani-png-2459071.png',
                                              scale: 100,
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "${val.cartList.toSet().toList()[index].dishName}",
                                                  ),
                                                  Text(
                                                      "${val.cartList.toSet().toList()[index].dishPrice}"),
                                                  Text(
                                                      "${val.cartList.toSet().toList()[index].dishCalories}"),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Colors.green,
                                            ),
                                            child: Row(
                                              children: [
                                                IconButton(
                                                    icon: Icon(Icons.add),
                                                    onPressed: null),
                                                Text("1"),
                                                IconButton(
                                                    icon: Icon(Icons.remove),
                                                    onPressed: null)
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Text("INR 20.00"),
                                            padding: EdgeInsets.all(8),
                                          )
                                        ],
                                      ),
                                      Divider(
                                        height: 1,
                                        thickness: 1,
                                        color: Colors.black12,
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Total Amount",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "INR 62.50",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  // height: 500,
                  width: 340,
                  padding: EdgeInsets.all(5),
                ),
              ),
              Spacer(),
              FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Container(
                  width: 300,
                  height: 50,
                  child: Center(
                    child: Text(
                      "Place Order",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.green.shade800,
                      borderRadius: BorderRadius.circular(30)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
