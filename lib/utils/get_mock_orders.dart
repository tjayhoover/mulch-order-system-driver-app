import 'dart:convert';

import 'package:driver_app/sample_orders_array.dart';
import 'package:driver_app/models/mulch_order.dart';

class MockOrders {
  static Future<List<MulchOrder>> getMockOrders() async {
    var orders = <MulchOrder>[];
    for (var order in mockOrders) {
      orders.add(MulchOrder.fromJson(jsonDecode(order)));
    }
    //
    // var dir = Directory("./sample_mulch_orders");

    // await for (var entity in dir.list(recursive: true, followLinks: false)) {
    //   File jsonFile = File(entity.path);
    //   orders
    //       .add(MulchOrder.fromJson(jsonDecode(await jsonFile.readAsString())));
    // }
    return orders;
  }
}
