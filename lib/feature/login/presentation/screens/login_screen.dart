import 'package:bloc_widgets/bloc_widgets.dart';
import 'package:flutter/material.dart';
import 'package:solvro_mobile_rekru/app/theme.dart';
import 'package:solvro_mobile_rekru/feature/login/presentation/bloc/login_cubit.dart';
import 'package:solvro_mobile_rekru/shared/utils/string_regexp.dart';

class LoginScreen extends BlocConsumerWidget<LoginCubit, LoginState> {
  LoginScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey();
  final GlobalKey<FormFieldState> emailKey = GlobalKey();
  final GlobalKey<FormFieldState> passwordKey = GlobalKey();

  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ValueNotifier<bool> isObscured = ValueNotifier(true);

  @override
  Widget buildWithState(context, bloc, state) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Basket buddy',
                style: TextStyle(fontSize: 46),
              ),
              const SizedBox(
                height: 46,
              ),
              ..._form(bloc, theme),
            ],
          ),
        ),
      ),
    );
  }

  _form(LoginCubit bloc, ThemeData theme) {
    return [
      TextFormField(
        key: emailKey,
        style: const TextStyle(color: Color(0xFFB1E3F9), fontSize: 20),
        keyboardType: TextInputType.emailAddress,
        textAlign: TextAlign.center,
        decoration: theme.emailDecoration(),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'E-mail can\'t be empty';
          }
          return value.matchesEmail() ? null : 'E-mail invalid';
        },
      ),
      ValueListenableBuilder(
        builder: (_, obscured, __) => TextFormField(
          key: passwordKey,
          style: const TextStyle(color: Color(0xFFB1E3F9), fontSize: 20),
          textAlign: TextAlign.center,
          obscureText: obscured,
          decoration: theme.passwordDecoration(
            suffixVisible: true,
            onTap: () => isObscured.value = !obscured,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Password can\'t be empty';
            }
            return value.matchesPassword() ? null : 'Password invalid';
          },
        ),
        valueListenable: isObscured,
      ),
      SizedBox(height: 32),
      ValueListenableBuilder(
        builder: (_, isLoading, __) => ElevatedButton(
          style: theme.flatButtonThemeInverted,
          // onPressed: isLoading ? null : () => _validateAndLogin(bloc),
          onPressed: () {},
          child: SizedBox(
            width: double.infinity,
            child: Center(
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 20,
                  color: theme.primaryColor,
                ),
              ),
            ),
          ),
        ),
        valueListenable: isLoading,
      ),
    ];
  }
}
