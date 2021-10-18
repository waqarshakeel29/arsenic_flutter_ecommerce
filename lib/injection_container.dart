import 'package:arsenic_flutter_ecommerce/controller/auth/bloc.dart' as login;
import 'package:arsenic_flutter_ecommerce/controller/home/bloc.dart' as home;
import 'package:arsenic_flutter_ecommerce/repository/auth/auth_repository.dart';
import 'package:arsenic_flutter_ecommerce/repository/auth/auth_repository_impl.dart';
import 'package:arsenic_flutter_ecommerce/repository/auth/source/auth_remote_data_source.dart';
import 'package:arsenic_flutter_ecommerce/repository/auth/source/auth_remote_data_source_impl.dart';
import 'package:arsenic_flutter_ecommerce/repository/home/home_repository.dart';
import 'package:arsenic_flutter_ecommerce/repository/home/home_repository_impl.dart';
import 'package:arsenic_flutter_ecommerce/repository/home/source/home_remote_data_source.dart';
import 'package:arsenic_flutter_ecommerce/repository/home/source/home_remote_data_source_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //init
  await Firebase.initializeApp();

  //BloC
  sl.registerLazySingleton(
      () => login.LoginBloc(login.InitialState(), loginRepository: sl()));
  sl.registerLazySingleton(
      () => home.HomeBloc(home.InitialState(), homeRepository: sl()));

  //Repositories
  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(loginRemoteDataSource: sl()),
  );
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(homeRemoteDataSource: sl()),
  );

  //Data Sources
  sl.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSourceImpl(firebaseAuthInstance: sl()),
  );
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(client: sl()),
  );

  //! External
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => http.Client());
}
