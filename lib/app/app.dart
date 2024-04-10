import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvro_mobile_rekru/app/theme.dart';
import 'package:solvro_mobile_rekru/feature/login/presentation/bloc/login_cubit.dart';
import 'package:solvro_mobile_rekru/feature/login/presentation/screens/login_screen.dart';
import 'package:solvro_mobile_rekru/feature/register/presentation/bloc/register_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginCubit()),
        BlocProvider(create: (_) => RegisterCubit()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: lightTheme,
          home: LoginScreen(),
        )
      ,
    );
  }
}