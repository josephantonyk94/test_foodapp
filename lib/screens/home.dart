import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_food_app/model/restaurent.dart';
import 'package:test_food_app/screens/order_summery.dart';
import 'package:test_food_app/widget/drawer_content.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<Restaurant> restaurantList = [];
  int cartLength = 0;

  @override
  void initState() {
    getRestaurants();
    super.initState();
  }

  getRestaurants() async {
    Dio().get('https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad').then((value) {
      setState(() {
        restaurantList =
            (value.data as List).map((e) => Restaurant.fromJson(e)).toList();
      });

      print(restaurantList.first.tableMenuList.last.menuCategory);
    });
  }
  List<CategoryDish> catDishList = [];
   findCartLegth(){
    restaurantList.first.tableMenuList.forEach((element) {
      element.categoryDishes.forEach((element1) {
        element1.itemSelected > 0 ?
        catDishList.add(element1) : null;
      });
    });
    setState(() {
      cartLength= catDishList.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return restaurantList.isNotEmpty
        ? Container(
            child: DefaultTabController(
              length: restaurantList.first.tableMenuList.length,
              child: Scaffold(
                  drawer: Drawer(
                    child: DrawerContents(),
                  ),
                  appBar: AppBar(backgroundColor: Colors.white,iconTheme: IconThemeData(color: Colors.grey),
                    // leading: Icon(Icons.menu),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Stack(children: [
                          IconButton(
                            icon: Icon(
                              Icons.shopping_cart,
                              size: 30,
                            ),
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => OrderSummery(restaurantList))),
                          ),
                          Positioned(
                            right: 5,
                            top: 5,
                            child: Container(
                              height: 20,
                              width: 20,
                              child: Center(
                                  child: Text(
                                "$cartLength",
                              )),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.redAccent,
                              ),
                            ),
                          )
                        ]),
                      )
                    ],
                    bottom: TabBar(unselectedLabelColor: Colors.grey,labelColor: Colors.redAccent,
                      isScrollable: true,
                      tabs: List.generate(
                            restaurantList.first.tableMenuList.length,
                            (index) => Tab(
                                  text:
                                      "${restaurantList.first.tableMenuList[index].menuCategory}",
                                ))
                      ,
                    ),
                  ),
                  body: TabBarView(
                    children: List.generate(
                          restaurantList.first.tableMenuList.length,
                          (index) => Container(
                                child: ListView.separated(
                                  itemCount: restaurantList
                                      .first
                                      .tableMenuList[index]
                                      .categoryDishes
                                      .length,
                                  itemBuilder: (context, index1) => Container(
                                    padding: EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Image.asset(
                                            restaurantList
                                                        .first
                                                        .tableMenuList[index]
                                                        .categoryDishes[index1]
                                                        .dishType ==
                                                    2
                                                ? 'assets/pngkey.com-veg-icon-png-2619381.png'
                                                : 'assets/pngkey.com-veg-biryani-png-2459071.png',
                                            height: 15,
                                            width: 15,
                                          ),
                                        ),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(width: 230,
                                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      child: Text(
                                                        "${restaurantList
                                                            .first
                                                            .tableMenuList[index]
                                                            .categoryDishes[index1].dishName}",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.w500),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceAround,
                                                children: [
                                                  Text(
                                                    "${restaurantList
                                                        .first
                                                        .tableMenuList[index]
                                                        .categoryDishes[index1].dishPrice}",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  SizedBox(
                                                    width: 60,
                                                  ),
                                                  Text(
                                                    "${restaurantList
                                                        .first
                                                        .tableMenuList[index]
                                                         .categoryDishes[index1].dishCalories} calories",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                              Container(width: 230,
                                                child: Column(
                                                  children: [
                                                   Text("${restaurantList
                                                       .first
                                                       .tableMenuList[index]
                                                       .categoryDishes[index1].dishDescription}"),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(40),
                                                    color: Colors.green.shade400),
                                                child: Row(
                                                  children: [
                                                    IconButton(
                                                      icon: Icon(
                                                        Icons.add,
                                                        color: Colors.white,
                                                      ),
                                                      onPressed: () {
                                                        setState(() {
                                                          restaurantList
                                                              .first
                                                              .tableMenuList[index]
                                                              .categoryDishes[index1].itemSelected++;
                                                          cartLength++;findCartLegth();
                                                        });
                                                      },
                                                    ),
                                                    Text(
                                                      '${ restaurantList
                                                          .first
                                                          .tableMenuList[index]
                                                          .categoryDishes[index1].itemSelected}',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    IconButton(
                                                      icon: Icon(Icons.remove,
                                                          color: Colors.white),
                                                      onPressed: () {
                                                        restaurantList
                                                            .first
                                                            .tableMenuList[index]
                                                            .categoryDishes[index1].itemSelected>0?setState(() {
                                                         restaurantList
                                                              .first
                                                              .tableMenuList[index]
                                                              .categoryDishes[index1].itemSelected--;

                                                        }):findCartLegth();
                                                        findCartLegth();
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              restaurantList
                                                  .first
                                                  .tableMenuList[index]
                                                  .categoryDishes[index1].addonCat.isNotEmpty?Container(
                                                child: Text(
                                                  "Customizations Available",
                                                  style: TextStyle(
                                                      color: Colors.redAccent,
                                                      fontSize: 18),
                                                ),
                                              ):Container()
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
                                  ),
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return Divider(
                                      color: Colors.black,
                                      height: 1,
                                    );
                                  },
                                ),
                              ))
                    ,
                  )),
            ),
          )
        : Center(child: CircularProgressIndicator());
  }
}

