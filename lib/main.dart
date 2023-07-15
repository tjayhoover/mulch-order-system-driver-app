import 'package:driver_app/cubits/login/login_cubit.dart';
import 'package:driver_app/cubits/order_retrieval/order_retrieval_cubit.dart';
import 'package:driver_app/repositories/login_repository.dart';
import 'package:driver_app/repositories/mocks/mock_login_repository.dart';
import 'package:driver_app/repositories/mocks/mock_order_repository.dart';
import 'package:driver_app/repositories/order_repository.dart';
import 'package:flutter/material.dart';

import 'package:driver_app/pages/login/login.dart';

import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  GetIt.I.registerSingleton<OrderRepository>(MockOrderRepository());
  GetIt.I.registerSingleton<LoginRepository>(MockLoginRepository());

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (BuildContext context) => MulchOrderCubit()),
      BlocProvider(create: (BuildContext context) => LoginCubit())
    ],
    child: MaterialApp(
      title: 'Mulch Order Delivery App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LogInPage(),
    ),
  ));
}
