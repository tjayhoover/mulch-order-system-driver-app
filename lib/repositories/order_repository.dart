import 'package:driver_app/models/mulch_order.dart';

abstract class OrderRepository {
  Future<List<MulchOrder>> getOrdersForToday();
}
