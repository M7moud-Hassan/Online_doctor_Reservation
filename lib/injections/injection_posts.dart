import 'package:online_doctor_reservation/features/posts/presentation/cubit/posts/posts_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/posts/data/datasources/post_local_data_source.dart';
import '../features/posts/data/datasources/post_remote_data_source.dart';
import '../features/posts/data/repositories/post_repository_impl.dart';
import '../features/posts/domain/repositories/posts_repository.dart';
import '../features/posts/domain/usecases/add_post.dart';
import '../features/posts/domain/usecases/delete_post.dart';
import '../features/posts/domain/usecases/get_all_posts.dart';
import '../features/posts/domain/usecases/update_post.dart';
import 'package:http/http.dart' as http;
import 'injection_sing_in.dart';

Future<void> init() async {
//! Features - posts
// Cubic
  sl.registerFactory(() => PostsCubit(getAllPostsUsecase: sl()));
// Usecases
  sl.registerLazySingleton(() => GetAllPostsUsecase(sl()));
  sl.registerLazySingleton(() => AddPostUsecase(sl()));
  sl.registerLazySingleton(() => DeletePostUsecase(sl()));
  sl.registerLazySingleton(() => UpdatePostUsecase(sl()));

// Repository

  sl.registerLazySingleton<PostsRepository>(
      () => PostsRepositoryImpl(remoteDataSource: sl(), localDataSource: sl()));

// Datasources

  sl.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<PostLocalDataSource>(
      () => PostLocalDataSourceImpl(sharedPreferences: sl()));

//! Core
//! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
}
