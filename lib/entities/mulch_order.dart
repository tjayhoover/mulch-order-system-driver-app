class MulchOrder {
  late int orderNumber;
  late String customerName;
  late String streetName;
  late String townName;
  late String state;
  late String mulchType;
  late DateTime orderDate;
  late DateTime deliveryIntervalStart;
  late DateTime deliveryIntervalEnd;
  late DateTime deliveredTime;
  late double balanceDue;
  late int houseNumber;
  late int zipCode;
  late int numberScoops;

  String getFullAddress() {
    return "$houseNumber $streetName $townName $state $zipCode";
  }
}
