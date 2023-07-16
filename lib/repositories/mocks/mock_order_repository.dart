import 'package:driver_app/models/mulch_order.dart';
import 'package:driver_app/repositories/order_repository.dart';

class MockOrderRepository implements OrderRepository {
  MockOrderRepository()
  @override
  List<MulchOrder> getOrdersForToday() {
    var response = <MulchOrder>[];
    var order1 = MulchOrder();
    order1.customerName = "Vernon Hoover";
    order1.balanceDue = 0;
    order1.deliveryIntervalStart = DateTime(2023, 5, 9, 9);
    order1.deliveryIntervalEnd = DateTime(2023, 5, 9, 10);
    order1.houseNumber = 30;
    order1.mulchType = "Coffee";
    order1.numberScoops = 6;
    order1.streetName = "Erbs Bridge Rd";
    order1.townName = "Lititz";
    order1.zipCode = 17543;
    order1.orderDate = DateTime(2023, 8, 15);
    order1.orderNumber = 0;
    order1.state = "PA";

    response.add(order1);
    return response;
  }
}
