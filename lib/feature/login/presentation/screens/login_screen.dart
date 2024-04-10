import 'package:bloc_widgets/bloc_widgets.dart';
import 'package:flutter/material.dart';
import 'package:solvro_mobile_rekru/feature/login/presentation/bloc/login_cubit.dart';

class LoginScreen extends BlocConsumerWidget<LoginCubit, LoginState>{

  const LoginScreen({super.key});

  @override
  Widget buildWithState(BuildContext context, LoginCubit bloc, LoginState state) {
    return const Scaffold(
      body: Center(
        child: Text('Login Screen'),
      ),
    );
  }
}