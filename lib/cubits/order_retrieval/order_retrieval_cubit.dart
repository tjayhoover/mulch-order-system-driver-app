import 'package:driver_app/repositories/order_repository.dart';
import 'package:driver_app/states/mulch_order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class MulchOrderCubit extends Cubit<MulchOrderState> {
  late OrderRepository orderRepo;
  MulchOrderCubit() : super(MulchOrderInitialState()) {
    orderRepo = GetIt.I<OrderRepository>();
  }

  void getOrders() async {
    try {
      emit(MulchOrderLoadingState());
      final orders = await orderRepo.getOrdersForToday();
      emit(MulchOrdersLoadedState(orders));
    } catch (e) {
      emit(MulchOrderFailureState());
    }
  }
}
