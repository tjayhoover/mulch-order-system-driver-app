import 'package:driver_app/models/mulch_order.dart';
import 'package:equatable/equatable.dart';


abstract class MulchOrderState extends Equatable {}

class MulchOrderInitialState extends MulchOrderState {
  @override
  List<Object?> get props => [];
}

class MulchOrderLoadingState extends MulchOrderState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MulchOrderLoadedState extends MulchOrderState {
  final MulchOrder order;
  MulchOrderLoadedState(this.order);
  @override
  List<Object?> get props => [order];
}

class MulchOrderFailureState extends MulchOrderState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MulchOrdersLoadingState extends MulchOrderState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MulchOrdersLoadedState extends MulchOrderState {
  final List<MulchOrder> orders;
  MulchOrdersLoadedState(this.orders);
  @override
  List<Object?> get props => [orders];
}

class MulchOrdersFailureState extends MulchOrderState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
