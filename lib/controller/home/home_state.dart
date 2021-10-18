import 'package:arsenic_flutter_ecommerce/domain/auth/app_user.dart';
import 'package:arsenic_flutter_ecommerce/domain/home/store_item.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends HomeState {}

class LoadingState extends HomeState {}

class LoadedState extends HomeState {
  final List<StoreItem> listStoreItems;

  LoadedState(this.listStoreItems);

  @override
  List<Object> get props => [listStoreItems];
}

class ErrorState extends HomeState {
  final String message;

  ErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
