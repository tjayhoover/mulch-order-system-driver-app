import 'package:driver_app/entities/mulch_order.dart';
import 'package:driver_app/repositories/order_repository.dart';

class MockOrderRepository implements OrderRepository {
  @override
  List<MulchOrder> getOrdersForToday() {
    List<MulchOrder> response = List.empty();
    return response;
  }
}
