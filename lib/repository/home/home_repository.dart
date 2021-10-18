

import 'package:arsenic_flutter_ecommerce/domain/home/store_item.dart';
import 'package:arsenic_flutter_ecommerce/shared/error/home/items_fetch_error.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<ItemsFetchError, List<StoreItem>>> getHomeProducts(
      String uid);
}
