import 'package:driver_app/cubits/order_retrieval/order_retrieval_cubit.dart';
import 'package:driver_app/states/mulch_order_state.dart';
import 'package:driver_app/utils/map_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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
      body: Center(
        child: Column(
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
                                if (selectedOrders.contains(index)) {
                                  selectedOrders.remove(index);
                                } else {
                                  if (selectedOrders.length >= 2) {
                                    selectedOrders.removeAt(0);
                                  }
                                  selectedOrders.add(index);
                                }
                              });
                              showDialog<void>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        title: const Text('Selected Orders'),
                                        content: SizedBox(
                                          height: 200,
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: ListView.builder(
                                                itemCount:
                                                    selectedOrders.length,
                                                itemBuilder: (context, index) {
                                                  return Card(
                                                      child: ListTile(
                                                    title: Text(
                                                        'Name : ${state.orders[index]}'),
                                                    subtitle: Center(
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                              "Time Slot: ${DateFormat.Hm().format(state.orders[index].deliveryIntervalStart)} - ${DateFormat.Hm().format(state.orders[index].deliveryIntervalEnd.toLocal())}"),
                                                          Text(
                                                              "${state.orders[index].numberScoops} ${state.orders[index].mulchType}"),
                                                        ],
                                                      ),
                                                    ),
                                                  ));
                                                }),
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text('Add Stop'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: const Text('Go'),
                                            onPressed: () {
                                              // Launch maps application
                                              NavigationUtils.navigateTo(
                                                  order.getFullAddress());
                                              // Navigate to "in progress" screen
                                              //Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      ));

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
      ),
    );
  }
}
