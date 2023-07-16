import 'package:driver_app/models/address.dart';

class MulchOrder {
  final int orderNumber;
  final String customerName;
  final Address address;
  final String customerPhoneNumber;
  final String mulchType;
  final DateTime orderDate;
  final DateTime deliveryIntervalStart;
  final DateTime deliveryIntervalEnd;
  final DateTime? deliveredTime;
  final int totalBalance;
  final int balanceDue;
  final int numberScoops;

  String getFullAddress() {
    return "${address.number} ${address.street} ${address.town} ${address.state} ${address.zip}";
  }

  MulchOrder.fromJson(Map<String, dynamic> json)
      : orderNumber = json['orderNumber'],
        customerName = json['customerName'],
        address = Address.fromJson(json['address']),
        customerPhoneNumber = json['customerPhoneNumber'],
        mulchType = json['mulchType'],
        orderDate = DateTime.parse(json['orderDate']),
        deliveryIntervalStart = DateTime.parse(json['deliveryIntervalStart']),
        deliveryIntervalEnd = DateTime.parse(json['deliveryIntervalEnd']),
        deliveredTime = (json['deliveredTime'] == null)
            ? null
            : DateTime.parse(json['deliveredTime']),
        totalBalance = json['totalBalance'],
        balanceDue = json['balanceDue'],
        numberScoops = json['numberScoops'];

  Map<String, dynamic> toJson() => {
        'orderNumber': orderNumber,
        'customerName': customerName,
        'address': address,
        'customerPhoneNumber': customerPhoneNumber,
        'mulchType': mulchType,
        'numberScoops': numberScoops,
        'orderDate': orderDate.toIso8601String(),
        'deliveryIntervalStart': deliveryIntervalStart.toIso8601String(),
        'deliveryIntervalEnd': deliveryIntervalEnd.toIso8601String(),
        'deliveredTime': deliveredTime?.toIso8601String(),
        'totalBalance': totalBalance,
        'balanceDue': balanceDue,
      };
}
