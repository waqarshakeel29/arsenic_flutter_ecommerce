import 'package:arsenic_flutter_ecommerce/controller/auth/login_bloc.dart';
import 'package:arsenic_flutter_ecommerce/repository/auth/login_repository.dart';
import 'package:arsenic_flutter_ecommerce/repository/auth/login_repository_impl.dart';
import 'package:arsenic_flutter_ecommerce/repository/auth/source/login_remote_data_source.dart';
import 'package:arsenic_flutter_ecommerce/repository/auth/source/login_remote_data_source_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import 'controller/auth/login_state.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //init
  await Firebase.initializeApp();

  //BloC
  sl.registerLazySingleton(
      () => LoginBloc(InitialState(), loginRepository: sl()));

  //Repositories
  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(loginRemoteDataSource: sl()),
  );

  //Data Sources
  sl.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSourceImpl(firebaseAuthInstance: sl()),
  );

  //! External
  sl.registerLazySingleton(() => FirebaseAuth.instance);
}
