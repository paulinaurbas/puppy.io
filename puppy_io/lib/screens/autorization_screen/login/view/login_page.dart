import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:puppy_io/screens/autorization_screen/login/bloc/login_bloc.dart';
import 'package:puppy_io/screens/autorization_screen/login/view/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GetIt getIt = GetIt.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return getIt.get<LoginBloc>();
        },
        child: const LoginForm(),
      ),
    );
  }
}
