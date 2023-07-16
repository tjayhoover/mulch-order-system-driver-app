import 'package:driver_app/models/mulch_order.dart';
import 'package:driver_app/repositories/order_repository.dart';
import 'package:driver_app/utils/get_mock_orders.dart';

class MockOrderRepository implements OrderRepository {
  @override
  Future<List<MulchOrder>> getOrdersForToday() async {
    // var response = <MulchOrder>[];
    // for (var order in MockOrders.orders) {
    //   response.add(MulchOrder.fromJson(jsonDecode(order)));
    // }
    // return response;
    return await MockOrders.getMockOrders();
  }
}
