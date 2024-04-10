import 'package:bloc_widgets/bloc_widgets.dart';
import 'package:flutter/material.dart';
import 'package:solvro_mobile_rekru/app/theme.dart';
import 'package:solvro_mobile_rekru/feature/register/presentation/bloc/register_cubit.dart';
import 'package:solvro_mobile_rekru/shared/utils/string_regexp.dart';

class RegisterScreen extends BlocConsumerWidget<RegisterCubit, RegisterState> {
  RegisterScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey();
  final GlobalKey<FormFieldState> emailKey = GlobalKey();
  final GlobalKey<FormFieldState> passwordKey = GlobalKey();
  final GlobalKey<FormFieldState> repeatKey = GlobalKey();

  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ValueNotifier<bool> isObscured = ValueNotifier(true);

  @override
  Widget buildWithState(context, bloc, state) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Padding(
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
            _form(bloc, theme),
            const SizedBox(height: 32),
            InkWell(
              child: const Text(
                'Already have an account? Login here!',
                style: TextStyle(
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                    color: Colors.white,
                    decorationColor: Colors.white
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  _form(RegisterCubit bloc, ThemeData theme) {
    return Form(
      key: formKey,
      child: ValueListenableBuilder(
          valueListenable: isObscured,
          builder: (_, obscured, __) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
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
                TextFormField(
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
                TextFormField(
                  key: repeatKey,
                  style: const TextStyle(color: Color(0xFFB1E3F9), fontSize: 20),
                  textAlign: TextAlign.center,
                  obscureText: obscured,
                  decoration: theme.passwordDecoration(suffixVisible: false),
                  validator: (value) {
                    if (value != passwordKey.currentState!.value) {
                      return 'Passwords aren\'t the same';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 32),
                ValueListenableBuilder(
                    valueListenable: isLoading,
                    builder: (_, isLoading, __) {
                      return SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          style: theme.flatButtonThemeInverted,
                          // onPressed:
                          // isLoading ? null : () => _validateAndRegister(bloc, dbRepository),
                          onPressed: () {  },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 20,
                              color: theme.primaryColor,
                            ),
                          ),
                        ),
                      );
                    }),
              ],
            );
          }),
    );
  }
}
