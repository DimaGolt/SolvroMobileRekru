import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvro_mobile_rekru/app/theme.dart';
import 'package:solvro_mobile_rekru/feature/login/presentation/bloc/login_cubit.dart';
import 'package:solvro_mobile_rekru/feature/login/presentation/screens/login_screen.dart';
import 'package:solvro_mobile_rekru/feature/main/presentation/bloc/shopping_list_bloc.dart';
import 'package:solvro_mobile_rekru/feature/register/presentation/bloc/register_cubit.dart';
import 'package:solvro_mobile_rekru/shared/domain/repositories/auth_repository.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => AuthRepository.build()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (ctx) => LoginCubit(ctx.read<AuthRepository>())),
          BlocProvider(create: (ctx) => RegisterCubit(ctx.read<AuthRepository>())),
          BlocProvider(create: (ctx) => ShoppingListBloc())
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: lightTheme,
            home: LoginScreen(),
          )
        ,
      ),
    );
  }
}