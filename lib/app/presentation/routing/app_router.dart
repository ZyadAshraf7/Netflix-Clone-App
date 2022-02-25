import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/auth/forget_password_cubit/forget_password_cubit.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/auth/login_cubit/login_cubit.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/auth/register_cubit/register_cubit.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/bottom_navbar_cubit/bottom_nav_bar_cubit.dart';
import 'package:netflix_app/app/core/constants/route_names.dart';
import 'package:netflix_app/app/data/repositories/authentication/email_verification_repository.dart';
import 'package:netflix_app/app/data/repositories/authentication/forget_password_repository.dart';
import 'package:netflix_app/app/data/repositories/authentication/login_repository.dart';
import 'package:netflix_app/app/data/repositories/authentication/register_repository.dart';
import 'package:netflix_app/app/presentation/screens/authentications/screens/email_verfifcation_screen.dart';
import 'package:netflix_app/app/presentation/screens/authentications/screens/forget_password_screen.dart';
import 'package:netflix_app/app/presentation/screens/authentications/screens/login_screen.dart';
import 'package:netflix_app/app/presentation/screens/authentications/screens/register_screen.dart';
import 'package:netflix_app/app/presentation/screens/bottom_navbar_screen/bottom_navbar_screen.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/home_screen.dart';
import 'package:netflix_app/app/presentation/screens/movie_details_screen/movie_details_screen.dart';

class AppRouter {
  late RegisterRepository registerRepository;
  late LoginRepository loginRepository;
  late EmailVerificationRepository emailVerificationRepository;
  late ForgetPasswordRepository forgetPasswordRepository;

  void initAppSettings() {
    registerRepository = RegisterRepository();
    loginRepository = LoginRepository();
    emailVerificationRepository = EmailVerificationRepository();
    forgetPasswordRepository = ForgetPasswordRepository();
  }

  Route? onGenerateRoutes(RouteSettings settings) {
    initAppSettings();
    switch (settings.name) {
      case RouteNames.bottomNavBarScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => BottomNavBarCubit(),
              ),
            ],
            child: const BottomNavBarScreen(),
          ),
        );
      case RouteNames.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(loginRepository: loginRepository),
            child: const LoginScreen(),
          ),
        );
      case RouteNames.registerScreen:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );
      case RouteNames.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case RouteNames.movieDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => const MovieDetailsScreen(),
        );
      case RouteNames.emailVerificationScreen:
        return MaterialPageRoute(
          builder: (_) => const EmailVerificationScreen(),
        );
      case RouteNames.forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ForgetPasswordCubit(forgetPasswordRepository: forgetPasswordRepository),
            child: const ForgetPasswordScreen(),
          ),
        );
    }
  }
}
