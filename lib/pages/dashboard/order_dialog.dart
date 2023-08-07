import 'package:driver_app/models/mulch_order.dart';
import 'package:flutter/material.dart';

class OrderDialogue extends StatelessWidget {
  const OrderDialogue(this.order, {super.key});
  final MulchOrder order;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text("Your Trip"),
        content: SizedBox(
          height: 200,
          child: Column(children: [
            Text(order.customerName),
            Text("${order.numberScoops.toString()} ${order.mulchType}"),
            Text(order.address.toString()),
          ]),
        ));
  }
}

// AlertDialog(
//                                         title: const Text('Selected Orders'),
//                                         content: SizedBox(
//                                           height: 200,
//                                           child: Align(
//                                             alignment: Alignment.centerLeft,
//                                             child: ListView.builder(
//                                                 itemCount:
//                                                     selectedOrders.length,
//                                                 itemBuilder: (context, index) {
//                                                   return Card(
//                                                       child: ListTile(
//                                                     title: Text(
//                                                         'Name : ${state.orders[index]}'),
//                                                     subtitle: Center(
//                                                       child: Column(
//                                                         children: [
//                                                           Text(
//                                                               "Time Slot: ${DateFormat.Hm().format(state.orders[index].deliveryIntervalStart)} - ${DateFormat.Hm().format(state.orders[index].deliveryIntervalEnd.toLocal())}"),
//                                                           Text(
//                                                               "${state.orders[index].numberScoops} ${state.orders[index].mulchType}"),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ));
//                                                 }),
//                                           ),
//                                         ),
//                                         actions: <Widget>[
//                                           TextButton(
//                                             child: const Text('Add Stop'),
//                                             onPressed: () {
//                                               Navigator.of(context).pop();
//                                             },
//                                           ),
//                                           TextButton(
//                                             child: const Text('Go'),
//                                             onPressed: () {
//                                               // Launch maps application
//                                               NavigationUtils.navigateTo(
//                                                   order.getFullAddress());
//                                               // Navigate to "in progress" screen
//                                               //Navigator.of(context).pop();
//                                             },
//                                           ),
//                                         ],
//                                       ));
