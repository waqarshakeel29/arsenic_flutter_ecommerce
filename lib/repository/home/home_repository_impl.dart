import 'package:arsenic_flutter_ecommerce/domain/home/store_item.dart';
import 'package:arsenic_flutter_ecommerce/repository/home/source/home_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:arsenic_flutter_ecommerce/shared/error/home/items_fetch_error.dart';

import 'home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepositoryImpl({
    required this.homeRemoteDataSource,
  });

  @override
  Future<Either<ItemsFetchError, List<StoreItem>>> getHomeProducts(
      String uid) async {
    final result = await homeRemoteDataSource.getHomeProducts(uid);
    return result.fold(
        (serverError) => Left(ItemsFetchError("Unable to get List")),
        (homeResponse) => Right(homeResponse.storeItems));
  }

  @override
  Future<Either<ItemsFetchError, List<StoreItem>>>
      getSelectedFilteredHomeProducts(String filterString) async {
    final result = await homeRemoteDataSource
        .getSelectedFilteredHomeProducts(filterString);
    return result.fold(
        (serverError) => Left(ItemsFetchError("Unable to get List")),
        (homeResponse) => Right(homeResponse.storeItems));
  }

  @override
  Future<Either<ItemsFetchError, List<StoreItem>>>
      getCatagoriesFilteredHomeProducts(List<String> filterList) async {
    final result = await homeRemoteDataSource
        .getCatagoriesFilteredHomeProducts(filterList);
    return result.fold(
        (serverError) => Left(ItemsFetchError("Unable to get List")),
        (homeResponse) => Right(homeResponse.storeItems));
  }
}
