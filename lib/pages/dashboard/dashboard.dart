import 'package:driver_app/cubits/order_retrieval/order_retrieval_cubit.dart';
import 'package:driver_app/models/mulch_order.dart';
import 'package:driver_app/states/mulch_order_state.dart';
import 'package:driver_app/utils/map_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'order_dialog.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hoover's Farm")),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(14.0),
            child: Text(
              'Pending Orders',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: BlocBuilder<MulchOrderCubit, MulchOrderState>(
              builder: (context, state) {
                if (state is MulchOrdersLoadedState) {
                  return ListView.builder(
                    itemCount: state.orders.length,
                    itemBuilder: (context, index) {
                      final order = state.orders[index];
                      return Card(
                        child: ListTile(
                          onTap: () {
                            showDialog<void>(
                                context: context,
                                builder: (BuildContext context) =>
                                    OrderDialogue(order));
                            //
                          },
                          title: Center(child: Text(order.customerName)),
                          subtitle: Center(
                            child: Column(
                              children: [
                                Text(
                                    "Time Slot: ${DateFormat.Hm().format(order.deliveryIntervalStart)} - ${DateFormat.Hm().format(order.deliveryIntervalEnd.toLocal())}"),
                                Text(
                                    "${order.numberScoops} ${order.mulchType}"),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is MulchOrderLoadingState) {
                  return const SizedBox(
                      width: 20,
                      height: 20,
                      child: Center(child: CircularProgressIndicator()));
                } else {
                  return Text(state.toString());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
