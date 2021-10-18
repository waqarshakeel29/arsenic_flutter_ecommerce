import 'package:arsenic_flutter_ecommerce/domain/home/home_response.dart';
import 'package:arsenic_flutter_ecommerce/domain/home/store_item.dart';
import 'package:dartz/dartz.dart';

import 'package:arsenic_flutter_ecommerce/shared/error/server_error.dart';

import 'home_remote_data_source.dart';
import 'package:http/http.dart' as http;

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final http.Client client;

  HomeRemoteDataSourceImpl({required this.client});

  @override
  Future<Either<ServerError, HomeResponse>> getHomeProducts(String uid) async {
    await Future.delayed(Duration(seconds: 5));
    List<StoreItem> storeItems = [];
    for (int i = 0; i < 10; i++) {
      storeItems.add(StoreItem(
          itemId: i.toString(), itemName: "Nike Bounce Shoes", itemPrice: 200));
    }
    return Right(HomeResponse(storeItems: storeItems));
  }
}
