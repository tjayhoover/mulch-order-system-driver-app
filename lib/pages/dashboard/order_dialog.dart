import 'package:flutter/material.dart';


class OrderDialogue extends StatelessWidget {
  const OrderDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(title: Text("Hello!"), content: Text("Content"));
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
