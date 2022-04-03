import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/auth/register_cubit/register_cubit.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/get_all_movies_data/get_all_movies_data_cubit.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/get_coming_soon_movies/coming_soon_movies_cubit.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/get_movies_data/get_movies_cubit.dart';
import 'package:netflix_app/app/data/repositories/authentication/register_repository.dart';
import 'package:netflix_app/app/data/repositories/get_all_movies_data/get_all_movies_data.dart';
import 'package:netflix_app/app/data/repositories/get_coming_soon_movies/get_comingSoonMovies.dart';
import 'package:netflix_app/app/data/repositories/get_movies_data/get_movies_data.dart';
import 'package:netflix_app/app/data/repositories/get_user_data/user_data_repository.dart';
import 'package:netflix_app/app/data/shared_preference/user_preference.dart';

import 'app/buinsness_logic/cubits/get_user_data/get_user_data_cubit.dart';
import 'app/core/constants/route_names.dart';
import 'app/core/theme/app_theme.dart';
import 'app/presentation/routing/app_router.dart';

class NetflixApp extends StatelessWidget {
  final AppRouter? appRouter;
  final String? initialRoute;

  const NetflixApp({Key? key, required this.appRouter,  this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(
            registerRepository: RegisterRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => GetUserDataCubit(userDataRepository: UserDataRepository()),
        ),
        BlocProvider(
          create: (context) => GetMoviesCubit(moviesRepository: MoviesRepository()),
        ),
        BlocProvider(
          create: (context) => ComingSoonMoviesCubit(comingSoonMoviesRepository: ComingSoonMoviesRepository()),
        ),
        BlocProvider(
          create: (context) => GetAllMoviesDataCubit(allMoviesDataRepository: AllMoviesDataRepository()),
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
          initialRoute: ((UserPreferences.getUserToken() != "") && UserPreferences.getUserVerification() == true)
              ? RouteNames.bottomNavBarScreen
              : RouteNames.loginScreen,
        ),
      ),
    );
  }
}
