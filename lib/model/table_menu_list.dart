import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:test_food_app/model/api/restaurent.dart';

class RestaurentList extends ChangeNotifier {
  List<TableMenu> tableMenuList = [];

  getRestaurant() async {
    Dio().get('https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad').then((value) {
      tableMenuList = (value.data as List)
          .map((e) => Restaurant.fromJson(e))
          .toList()
          .first
          .tableMenuList;
      notifyListeners();
      print(tableMenuList.last.menuCategory);
    });
  }

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}
