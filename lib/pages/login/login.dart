import 'package:driver_app/cubits/order_retrieval/order_retrieval_cubit.dart';
import 'package:driver_app/pages/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:driver_app/cubits/login/login_cubit.dart';
import 'package:driver_app/states/login_state.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});

  final usrnmCtrl = TextEditingController();
  final pwCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text(
                  "Hoover's Farm",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            SizedBox(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: TextField(
                    decoration: const InputDecoration(hintText: 'Username'),
                    controller: usrnmCtrl),
              ),
            ),
            SizedBox(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Password',
                    ),
                    obscureText: true,
                    controller: pwCtrl),
              ),
            ),
            SizedBox(
              width: 150,
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: ElevatedButton(
                  child: const Text('Log In'),
                  onPressed: () async {
                    var loginCubit = BlocProvider.of<LoginCubit>(context);
                    loginCubit.logIn(usrnmCtrl.text, pwCtrl.text);
                  },
                ),
              ),
            ),
            BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
              if (state is LoginSuccessState) {
                var bloc = BlocProvider.of<MulchOrderCubit>(context);
                bloc.getOrders();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Dashboard()),
                );
              } else if (state is LoginFailureState) {
                showDialog<void>(
                    context: context,
                    builder: (BuildContext context) => const AlertDialog(
                          title: Text('Error'),
                          content: Text('Login failed. Try again.'),
                        ));
                usrnmCtrl.clear();
                pwCtrl.clear();
              }
            }, builder: (context, state) {
              if (state is LoginInitialState) {
                return const Text('');
              } else if (state is LoginLoadingState) {
                return const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: CircularProgressIndicator(),
                );
              } else if (state is LoginSuccessState) {
                // What should we do here?
                return Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                      "You (${state.loggedInUser.role}) are logged in as ${state.loggedInUser.name}"),
                );
              } else if (state is LoginFailureState) {
                // TODO: What should actually be done here?
                return Container();
              } else {
                return Text(state.toString());
              }
            }),
          ],
        ),
      ),
    );
  }
}
