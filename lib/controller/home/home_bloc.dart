import 'package:arsenic_flutter_ecommerce/controller/home/home_event.dart';
import 'package:arsenic_flutter_ecommerce/controller/home/home_state.dart';
import 'package:arsenic_flutter_ecommerce/domain/home/store_item.dart';
import 'package:arsenic_flutter_ecommerce/repository/home/home_repository.dart';
import 'package:arsenic_flutter_ecommerce/shared/error/home/items_fetch_error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc(HomeState initialState, {required this.homeRepository})
      : super(initialState);

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is FetchItemsEvent) {
      yield LoadingState();
      Either<ItemsFetchError, List<StoreItem>> response =
          await homeRepository.getHomeProducts(event.uid);
      print("Response from bloc");
      print(response);
      yield response.fold((failure) => ErrorState(message: "Unable Sign Up"),
          (listStoreItems) => LoadedState(listStoreItems));
    }
  }
}
