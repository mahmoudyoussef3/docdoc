import 'package:dio/dio.dart';
import 'package:docdoc/core/networking/api_service.dart';
import 'package:docdoc/core/networking/dio_factory.dart';
import 'package:docdoc/features/login/data/repo/login_repo.dart';
import 'package:docdoc/features/login/logic/cubit/login_cubit.dart';
import 'package:docdoc/features/signup/data/repo/signup_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/signup/logic/cubit/signup_cubit.dart';
final getIt = GetIt.instance;

Future<void> setUpGetIt()async{
  Dio dio = await DioFactory.getDio();

  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
///Login dependency injection
  getIt.registerLazySingleton<LoginRepo>(()=> LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(()=> LoginCubit(getIt()));

///Signup dependency Injection
  getIt.registerLazySingleton<SignupRepo>(()=> SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(()=> SignupCubit(getIt()));


}