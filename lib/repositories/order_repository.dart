import 'package:driver_app/entities/mulch_order.dart';

abstract class OrderRepository {
  List<MulchOrder> getOrdersForToday();
}
