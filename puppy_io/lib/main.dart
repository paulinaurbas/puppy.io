import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puppy_io/screens/main_screen/view/main_screen_page.dart';
import 'package:puppy_io/screens/main_screen/bloc/main_screen_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();


  runApp(
      EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('pl')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: BlocProvider(
          create: (context) =>
              CounterBloc(
                CounterState(counter: 0),
              ), child: const MyApp(),
        ),
      ));
  }
