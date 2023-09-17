import 'package:avocado/core/network/network_info.dart';
import 'package:avocado/features/api_post/data/datasources/post_remote_datasource.dart';
import 'package:avocado/features/api_post/data/repository/post_repository_impl.dart';
import 'package:avocado/features/api_post/domain/repository/post_repository.dart';
import 'package:avocado/features/api_post/domain/usecase/get_post_screen.dart';
import 'package:avocado/features/api_post/presentations/bloc/post_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => PostBloc(getPostScreen: sl()),
  );
  sl.registerLazySingleton(() => GetPostScreen(repository: sl()));
  sl.registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(postRemoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSourceImpl());
  //core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
