import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_food_app/model/api/restaurent.dart';
import 'package:test_food_app/model/cart.dart';
import 'package:test_food_app/model/restaurant_provider.dart';
import 'package:test_food_app/screens/order_summery.dart';
import 'package:test_food_app/widget/carticon.dart';
import 'package:test_food_app/widget/dish_card.dart';
import 'package:test_food_app/widget/drawer_content.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    //context.read<RestaurantProvider>().getRestaurant();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<List<TableMenu>>(
      builder: (context, val, __) {
        List<TableMenu> tableMenuList = val;
        print(val.length);
        return tableMenuList.length > 0
            ? Container(
                child: DefaultTabController(
                length: tableMenuList.length,
                child: Scaffold(
                  drawer: Drawer(
                    child: DrawerContents(),
                  ),
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    iconTheme: IconThemeData(color: Colors.grey),
                    // leading: Icon(Icons.menu),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ChangeNotifierProvider<Cart>.value(
                          value: context.watch<Cart>(),
                          builder: (context, child) => child!,
                          child: CartIcon(),
                        ),
                      )
                    ],
                    bottom: TabBar(
                      unselectedLabelColor: Colors.grey,
                      labelColor: Colors.redAccent,
                      isScrollable: true,
                      tabs: List.generate(
                          tableMenuList.length,
                          (index) => Tab(
                                text: "${tableMenuList[index].menuCategory}",
                              )),
                    ),
                  ),
                  body: TabBarView(
                      children: List.generate(
                    tableMenuList.length,
                    (index) => Container(
                        child: ListView.builder(
                      itemBuilder: (context1, index1) => DishCard(
                        index: index1,
                        tableMenu: tableMenuList[index],
                      ),
                      itemCount: tableMenuList[index].categoryDishes.length,
                    )),
                  )),
                ),
              ))
            : Container(child: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
