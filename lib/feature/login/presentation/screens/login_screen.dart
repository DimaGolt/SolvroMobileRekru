import 'package:bloc_widgets/bloc_widgets.dart';
import 'package:flutter/material.dart';
import 'package:solvro_mobile_rekru/app/theme.dart';
import 'package:solvro_mobile_rekru/feature/login/presentation/bloc/login_cubit.dart';
import 'package:solvro_mobile_rekru/feature/register/presentation/screens/register_screen.dart';
import 'package:solvro_mobile_rekru/shared/utils/string_regexp.dart';

import '../../../shopping_lists/presentation/screens/shopping_lists_screen.dart';

class LoginScreen extends BlocConsumerWidget<LoginCubit, LoginState> {
  LoginScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey();
  final GlobalKey<FormFieldState> emailKey = GlobalKey();
  final GlobalKey<FormFieldState> passwordKey = GlobalKey();

  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ValueNotifier<bool> isObscured = ValueNotifier(true);

  @override
  void listener(BuildContext context, LoginCubit bloc, LoginState state) {
    state.maybeMap(
      error: (state) {
        isLoading.value = false;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
      },
      success: (state) =>
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const ShoppingListsScreen()), (_) => false),
      loading: (state) => isLoading.value = true,
      orElse: () => isLoading.value = (state is Loading),
    );
  }

  @override
  Widget buildWithState(context, bloc, state) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Basket buddy',
                style: TextStyle(fontSize: 46, color: Colors.white),
              ),
              const SizedBox(
                height: 46,
              ),
              ..._form(bloc, theme),
              const SizedBox(height: 32),
              InkWell(
                child: const Text(
                  'Don\'t have an account? Create one now!',
                  style: TextStyle(
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                    color: Colors.white,
                    decorationColor: Colors.white
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => RegisterScreen()));
                },
              ),
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
          onPressed: isLoading ? null : () => _validateAndLogin(bloc),
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

  _validateAndLogin(LoginCubit bloc) {
    if (formKey.currentState!.validate()) {
      bloc.loginWithEmail(emailKey.currentState!.value, passwordKey.currentState!.value);
    }
  }
}
