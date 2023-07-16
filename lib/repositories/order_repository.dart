import 'package:driver_app/models/mulch_order.dart';

abstract class OrderRepository {
  List<MulchOrder> getOrdersForToday();
}
