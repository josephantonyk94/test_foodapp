import 'package:dio/dio.dart';
import 'package:test_food_app/model/api/restaurent.dart';

class RestaurantProvider {
  List<TableMenu> tableMenuList = [];

  Future<List<TableMenu>> getRestaurant() async {
    final result =
        await Dio().get('https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad');
    tableMenuList = (result.data as List)
        .map((e) => Restaurant.fromJson(e))
        .toList()
        .first
        .tableMenuList;
    print(tableMenuList.last.menuCategory);
    return tableMenuList;
  }
}
