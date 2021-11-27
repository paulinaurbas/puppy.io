import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:puppy_io/auth/user_repository.dart';
import 'package:puppy_io/data/api_provider.dart';
import 'package:puppy_io/data/repository.dart';
import 'package:puppy_io/helpers/shared_preferences_helper/shared_preferences_helper.dart';
import 'package:puppy_io/screens/autorization_screen/authentication/bloc/authentication_bloc.dart';
import 'package:puppy_io/screens/autorization_screen/login/bloc/login_bloc.dart';
import 'package:puppy_io/screens/main_screen.dart';
import 'auth/auth_repository.dart';

GetIt getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerFactory(() => SharedPreferencesHelper());
  getIt.registerLazySingleton(() => AuthenticationRepository(getIt.get<SharedPreferencesHelper>()));
  getIt.registerFactory(() => UserRepository(getIt.get<SharedPreferencesHelper>()));
  getIt.registerFactory(() => ApiProvider());
  getIt.registerFactory(() => Repository());
  getIt.registerFactory(() => AuthenticationBloc(
    authenticationRepository: getIt.get<AuthenticationRepository>(),
    userRepository: getIt.get<UserRepository>(),
  ));
  getIt.registerFactory(() => LoginBloc(authenticationRepository: getIt.get<AuthenticationRepository>()));

}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await init();

  runApp(EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('pl')],
    path: 'assets/translations',
    fallbackLocale: const Locale('en'),
    child: RepositoryProvider.value(
      value: getIt.get<AuthenticationRepository>(),
      child: BlocProvider(
        create: (_) =>  getIt.get<AuthenticationBloc>(),
        child: MyApp(),
      ),
    ),
  ));
}

