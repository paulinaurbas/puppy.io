import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:puppy_io/generated/locale_keys.g.dart';
import 'package:puppy_io/screens/autorization_screen/login/bloc/login_bloc.dart';
import 'package:puppy_io/widgets/outline_button.dart';
import 'package:puppy_io/widgets/primary_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
      if (state.status.isSubmissionFailure) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(content: Text(LocaleKeys.authenticationFailure.tr())),
          );
      }
    }, builder: (context, state) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _BackgroundPhoto(),
            const SizedBox(height: 12),
            _TitleLabel(
              labelName: state.registration ? LocaleKeys.registration.tr() : LocaleKeys.login.tr(),
            ),
            const SizedBox(height: 12),
            _EmailInput(),
            const SizedBox(height: 12),
            if (state.registration) _UsernameInput(),
            if (state.registration) const SizedBox(height: 12),
            _PasswordInput(),
            const SizedBox(height: 12),
            _MainButton(),
            const SizedBox(height: 12),
            _NavigationButton(),
            const SizedBox(height: 36),
          ],
        ),
      );
    });
  }
}

class _TitleLabel extends StatelessWidget {
  final String labelName;

  const _TitleLabel({required this.labelName});

  @override
  Widget build(BuildContext context) {
    return Text(
      labelName,
      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
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
      padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 8),
      child: BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.username != current.username,
        builder: (context, state) {
          return TextField(
            key: const Key('loginForm_usernameInput_textField'),
            onChanged: (username) => context.read<LoginBloc>().add(LoginUsernameChanged(username)),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(width: 1, style: BorderStyle.solid, color: Colors.black),
              ),
              hintStyle: TextStyle(color: Colors.grey[800]),
              labelText: LocaleKeys.username.tr(),
              errorText: state.username!.invalid ? LocaleKeys.invalidUsername.tr() : null,
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
      padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 8),
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
                borderSide: const BorderSide(width: 1, style: BorderStyle.solid, color: Colors.black),
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

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 8),
      child: BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) {
          return TextField(
            key: const Key('loginForm_emailInput_textField'),
            onChanged: (password) => context.read<LoginBloc>().add(LoginEmailChanged(password)),
            obscureText: true,
            decoration: InputDecoration(
              labelText: LocaleKeys.email.tr(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(width: 1, style: BorderStyle.solid, color: Colors.black),
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

class _MainButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.status != current.status || previous.registration != current.registration,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : PrimaryButton(
                buttonDescription: state.registration ? LocaleKeys.register.tr() : LocaleKeys.login.tr(),
                onPressed: state.status.isValidated
                    ? () {
                        if (!state.registration) {
                          context.read<LoginBloc>().add(const LoginSubmitted());
                        } else {
                          context.read<LoginBloc>().add(const RegisterSubmitted());
                        }
                      }
                    : null,
              );
      },
    );
  }
}

class _NavigationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.status != current.status || previous.registration != current.registration,
      builder: (context, state) {
        return PuppyIoOutlineButton(
          buttonDescription: state.registration ? LocaleKeys.login.tr() : LocaleKeys.registration.tr(),
          onPressed: () {
            context.read<LoginBloc>().add(const ChangedPageEvent());
          },
        );
      },
    );
  }
}
