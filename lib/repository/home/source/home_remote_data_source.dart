import 'package:arsenic_flutter_ecommerce/domain/home/home_response.dart';
import 'package:arsenic_flutter_ecommerce/shared/error/server_error.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRemoteDataSource {
  Future<Either<ServerError, HomeResponse>> getHomeProducts(String uid);
}
