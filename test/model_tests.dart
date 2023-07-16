// Import the test package and Counter class
import 'package:driver_app/models/address.dart';
import 'package:driver_app/models/mulch_order.dart';
import 'package:test/test.dart';
import 'dart:convert';

void main() {
  group('Model Tests', () {
    test('Address toJson Test', () {
      final address = Address(10, "street name", "town", "ST", 12345);

      String json = jsonEncode(address.toJson());

      expect(json,
          '{"number":10,"street":"street name","town":"town","state":"ST","zip":12345}');
    });
    test('Address fromJson Test', () {
      String json =
          '{"number":10,"street":"street name","town":"town","state":"ST","zip":12345}';
      final address = Address.fromJson(jsonDecode(json));

      expect(address.number, 10);
      expect(address.street, "street name");
      expect(address.town, "town");
      expect(address.state, "ST");
      expect(address.zip, 12345);
    });

    test('MulchOrder fromJson Test', () {
      String json =
          '{"orderNumber":10,"customerName":"customer","address":{"number":11,"street":"street name","town":"town","state":"ST","zip":12345},"customerPhoneNumber":"5555555555","mulchType":"mulch","numberScoops":5,"orderDate":"2023-09-05T00:00:00.000","deliveryIntervalStart":"2023-09-06T10:00:00.000","deliveryIntervalEnd":"2023-09-06T11:00:00.000","deliveredTime":"2023-09-06T10:30:00.000","totalBalance":5000,"balanceDue":3000}';

      final order = MulchOrder.fromJson(jsonDecode(json));

      expect(order.orderNumber, 10);
      expect(order.customerName, "customer");
      expect(order.address.number, 11);
      expect(order.address.street, "street name");
      expect(order.address.town, "town");
      expect(order.address.state, "ST");
      expect(order.address.zip, 12345);
      expect(order.customerPhoneNumber, "5555555555");
      expect(order.mulchType, "mulch");
      expect(order.numberScoops, 5);
      expect(order.orderDate, DateTime(2023, 9, 5));
      expect(order.deliveryIntervalStart, DateTime(2023, 9, 6, 10));
      expect(order.deliveryIntervalEnd, DateTime(2023, 9, 6, 11));
      expect(order.deliveredTime, DateTime(2023, 9, 6, 10, 30));
      expect(order.totalBalance, 5000);
      expect(order.balanceDue, 3000);
    });

    test('MulchOrder toJson Test', () {
      String json =
          '{"orderNumber":10,"customerName":"customer","address":{"number":11,"street":"street name","town":"town","state":"ST","zip":12345},"customerPhoneNumber":"5555555555","mulchType":"mulch","numberScoops":5,"orderDate":"2023-09-05T00:00:00.000","deliveryIntervalStart":"2023-09-06T10:00:00.000","deliveryIntervalEnd":"2023-09-06T11:00:00.000","deliveredTime":"2023-09-06T10:30:00.000","totalBalance":5000,"balanceDue":3000}';

      final order = MulchOrder.fromJson(jsonDecode(json));

      String createdJson = jsonEncode(order.toJson());
      expect(createdJson, json);
    });

    test('MulchOrder fromJson with null deliveredTime field', () {
      String json =
          '{"orderNumber":10,"customerName":"customer","address":{"number":11,"street":"street name","town":"town","state":"ST","zip":12345},"customerPhoneNumber":"5555555555","mulchType":"mulch","numberScoops":5,"orderDate":"2023-09-05T00:00:00.000","deliveryIntervalStart":"2023-09-06T10:00:00.000","deliveryIntervalEnd":"2023-09-06T11:00:00.000","deliveredTime":null,"totalBalance":5000,"balanceDue":3000}';

      final order = MulchOrder.fromJson(jsonDecode(json));

      expect(order.orderNumber, 10);
      expect(order.customerName, "customer");
      expect(order.address.number, 11);
      expect(order.address.street, "street name");
      expect(order.address.town, "town");
      expect(order.address.state, "ST");
      expect(order.address.zip, 12345);
      expect(order.customerPhoneNumber, "5555555555");
      expect(order.mulchType, "mulch");
      expect(order.numberScoops, 5);
      expect(order.orderDate, DateTime(2023, 9, 5));
      expect(order.deliveryIntervalStart, DateTime(2023, 9, 6, 10));
      expect(order.deliveryIntervalEnd, DateTime(2023, 9, 6, 11));
      expect(order.deliveredTime, null);
      expect(order.totalBalance, 5000);
      expect(order.balanceDue, 3000);
    });

    test('MulchOrder fromJson with missing deliveredTime field', () {
      String json =
          '{"orderNumber":10,"customerName":"customer","address":{"number":11,"street":"street name","town":"town","state":"ST","zip":12345},"customerPhoneNumber":"5555555555","mulchType":"mulch","numberScoops":5,"orderDate":"2023-09-05T00:00:00.000","deliveryIntervalStart":"2023-09-06T10:00:00.000","deliveryIntervalEnd":"2023-09-06T11:00:00.000","totalBalance":5000,"balanceDue":3000}';

      final order = MulchOrder.fromJson(jsonDecode(json));

      expect(order.orderNumber, 10);
      expect(order.customerName, "customer");
      expect(order.address.number, 11);
      expect(order.address.street, "street name");
      expect(order.address.town, "town");
      expect(order.address.state, "ST");
      expect(order.address.zip, 12345);
      expect(order.customerPhoneNumber, "5555555555");
      expect(order.mulchType, "mulch");
      expect(order.numberScoops, 5);
      expect(order.orderDate, DateTime(2023, 9, 5));
      expect(order.deliveryIntervalStart, DateTime(2023, 9, 6, 10));
      expect(order.deliveryIntervalEnd, DateTime(2023, 9, 6, 11));
      expect(order.deliveredTime, null);
      expect(order.totalBalance, 5000);
      expect(order.balanceDue, 3000);
    });

    test('MulchOrder fromJson with totalBalance as int, not double', () {
      String json =
          '{"orderNumber":10,"customerName":"customer","address":{"number":11,"street":"street name","town":"town","state":"ST","zip":12345},"customerPhoneNumber":"5555555555","mulchType":"mulch","numberScoops":5,"orderDate":"2023-09-05T00:00:00.000","deliveryIntervalStart":"2023-09-06T10:00:00.000","deliveryIntervalEnd":"2023-09-06T11:00:00.000","totalBalance":5000,"balanceDue":3000}';

      final order = MulchOrder.fromJson(jsonDecode(json));

      expect(order.orderNumber, 10);
      expect(order.customerName, "customer");
      expect(order.address.number, 11);
      expect(order.address.street, "street name");
      expect(order.address.town, "town");
      expect(order.address.state, "ST");
      expect(order.address.zip, 12345);
      expect(order.customerPhoneNumber, "5555555555");
      expect(order.mulchType, "mulch");
      expect(order.numberScoops, 5);
      expect(order.orderDate, DateTime(2023, 9, 5));
      expect(order.deliveryIntervalStart, DateTime(2023, 9, 6, 10));
      expect(order.deliveryIntervalEnd, DateTime(2023, 9, 6, 11));
      expect(order.deliveredTime, null);
      expect(order.totalBalance, 5000);
      expect(order.balanceDue, 3000);
    });
  });
}
