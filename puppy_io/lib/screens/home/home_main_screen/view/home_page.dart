import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puppy_io/generated/locale_keys.g.dart';
import 'package:puppy_io/screens/autorization_screen/authentication/bloc/authentication_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _BackgroundPhoto(),
          Builder(
            builder: (context) {
              final userId = context.select(
                    (AuthenticationBloc bloc) => bloc.state.user.id,
              );
              return Text('UserID: $userId');
            },
          ),
          ElevatedButton(
            child: const Text('Create offer with puppy'),
            onPressed: () {
              //TODO
            },
          ),
          ElevatedButton(
            child: Text(LocaleKeys.logout.tr()),
            onPressed: () {
              context
                  .read<AuthenticationBloc>()
                  .add(AuthenticationLogoutRequested());
            },
          ),
        ],
      ),
    );
  }
}

class _BackgroundPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage('assets/images/backgroun_main_scree.png'),
      fit: BoxFit.cover,
    );
  }
}