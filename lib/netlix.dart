import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/auth/register_cubit/register_cubit.dart';
import 'package:netflix_app/app/data/repositories/authentication/email_verification_repository.dart';
import 'package:netflix_app/app/data/repositories/authentication/register_repository.dart';
import 'package:netflix_app/app/data/shared_preference/user_preference.dart';

import 'app/core/constants/route_names.dart';
import 'app/core/theme/app_theme.dart';
import 'app/presentation/routing/app_router.dart';

class NetflixApp extends StatelessWidget {
  final AppRouter? appRouter;
  final String? initialRoute;

  const NetflixApp({Key? key, required this.appRouter, required this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(
            registerRepository: RegisterRepository(),
          ),
        ),
      ],
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: MaterialApp(
          theme: AppTheme.appThemeMode,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter!.onGenerateRoutes,
          initialRoute: (UserPreferences.getUserToken() != 'error token' && UserPreferences.getUserVerification() == true)
              ? RouteNames.bottomNavBarScreen
              : RouteNames.loginScreen,
        ),
      ),
    );
  }
}
