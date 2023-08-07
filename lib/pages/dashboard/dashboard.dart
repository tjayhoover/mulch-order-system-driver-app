import 'package:driver_app/cubits/order_retrieval/order_retrieval_cubit.dart';
import 'package:driver_app/models/mulch_order.dart';
import 'package:driver_app/states/mulch_order_state.dart';
import 'package:driver_app/utils/map_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'order_dialog.dart';

// import 'package:project3_ui/cubits/assignments/assignments_cubit.dart';
// import 'package:project3_ui/pages/student/submit_assignment/assignment_view.dart';
// import 'package:project3_ui/cubits/submissions/submissions_cubit.dart';
// import 'package:project3_ui/cubits/states/assignment_state.dart';

// import 'package:project3_ui/pages/student/student_grade_report/student_grade_report.dart';
// import 'package:project3_ui/cubits/grade_reports/student_grade_report_cubit.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  List<int> selectedOrders = [];

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
          SizedBox(
            width: 500,
            height: 300,
            child: BlocBuilder<MulchOrderCubit, MulchOrderState>(
              builder: (context, state) {
                if (state is MulchOrdersLoadedState) {
                  return ListView.builder(
                    itemCount: state.orders.length,
                    itemBuilder: (context, index) {
                      final order = state.orders[index];
                      return Card(
                        color: selectedOrders.contains(index)
                            ? Colors.lightGreen.shade300
                            : Colors.transparent,
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              // TODO: refine this logic
                              if (selectedOrders.contains(index)) {
                                selectedOrders.remove(index);
                              } else {
                                if (selectedOrders.length >= 2) {
                                  selectedOrders.removeAt(0);
                                }
                                selectedOrders.add(index);
                              }
                            });
                            List<MulchOrder> chosenOrders = [];

                            // TODO: refine this logic
                            for (int i in selectedOrders) {
                              chosenOrders.add(state.orders[i]);
                            }

                            showDialog<void>(
                                context: context,
                                builder: (BuildContext context) =>
                                    OrderDialogue(chosenOrders));
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
