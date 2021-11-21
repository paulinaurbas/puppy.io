import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:puppy_io/generated/locale_keys.g.dart';
import 'package:puppy_io/screens/autorization_screen/login/bloc/login_bloc.dart';
import 'package:puppy_io/widgets/primary_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _BackgroundPhoto(),
            const SizedBox(height: 12),
            _TitleLabel(),
            const SizedBox(height: 12),
            _UsernameInput(),
            const SizedBox(height: 12),
            _PasswordInput(),
            const SizedBox(height: 12),
            _LoginButton(),
          ],
        ),
      ),
    );
  }
}

class _TitleLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      LocaleKeys.login.tr(),
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    );
  }
}

class _BackgroundPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage('assets/images/background_photo.png'),
      fit: BoxFit.cover,
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
      child: BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.username != current.username,
        builder: (context, state) {
          return TextField(
            key: const Key('loginForm_usernameInput_textField'),
            onChanged: (username) => context.read<LoginBloc>().add(LoginUsernameChanged(username)),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(width: 3, style: BorderStyle.solid, color: Colors.black),
              ),
              hintStyle: TextStyle(color: Colors.grey[800]),
              labelText: LocaleKeys.username.tr(),
              errorText: state.username.invalid ? 'invalid username' : null,
            ),
          );
        },
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
      child: BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) {
          return TextField(
            key: const Key('loginForm_passwordInput_textField'),
            onChanged: (password) => context.read<LoginBloc>().add(LoginPasswordChanged(password)),
            obscureText: true,
            decoration: InputDecoration(
              labelText: LocaleKeys.password.tr(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(width: 3, style: BorderStyle.solid, color: Colors.black),
              ),
              hintStyle: TextStyle(
                color: Colors.grey[800],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : PrimaryButton(
                buttonDescription: LocaleKeys.login.tr(),
                onPressed: state.status.isValidated
                    ? () {
                        context.read<LoginBloc>().add(const LoginSubmitted());
                      }
                    : null,
              );
      },
    );
  }
}
