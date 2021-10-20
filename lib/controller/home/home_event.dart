import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchItemsEvent extends HomeEvent {
  final String uid;

  FetchItemsEvent(this.uid);

  @override
  List<Object> get props => [uid];
}

class FilterEvent extends HomeEvent {
  final String filterString;

  FilterEvent(this.filterString);

  @override
  List<Object> get props => [filterString];
}

class FilterCatagoriesEvent extends HomeEvent {
  final List<String> filterList;

  FilterCatagoriesEvent(this.filterList);

  @override
  List<Object> get props => [filterList];
}
