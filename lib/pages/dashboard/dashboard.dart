import 'package:driver_app/cubits/order_retrieval/order_retrieval_cubit.dart';
import 'package:driver_app/states/mulch_order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


// import 'package:project3_ui/cubits/assignments/assignments_cubit.dart';
// import 'package:project3_ui/pages/student/submit_assignment/assignment_view.dart';
// import 'package:project3_ui/cubits/submissions/submissions_cubit.dart';
// import 'package:project3_ui/cubits/states/assignment_state.dart';


// import 'package:project3_ui/pages/student/student_grade_report/student_grade_report.dart';
// import 'package:project3_ui/cubits/grade_reports/student_grade_report_cubit.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  void selectAssignment() {}

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
                        return ListTile(
                          // onTap: () {
                          //   var subCubit =
                          //       BlocProvider.of<SubmissionCubit>(context);
                          //   subCubit.emitInit(); // Emit the initial state
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             AssignmentView(assignment: assignment)),
                          //   );
                          // },
                          title: Center(child: Text(order.customerName)),
                          subtitle: Center(
                            child: Text(
                                "Delivery Date: ${DateFormat.yMMMd().format(order.deliveryDate)}"),
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
                    return const Text('Unknown State');
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
