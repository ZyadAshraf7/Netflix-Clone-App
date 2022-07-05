import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/user_movies_list/user_movies_list_cubit.dart';
import 'package:netflix_app/app/core/constants/route_names.dart';
import 'package:netflix_app/app/data/shared_preference/user_preference.dart';

import '../../../../buinsness_logic/cubits/get_user_data/get_user_data_cubit.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         FirebaseAuth.instance.signOut();
         GoogleSignIn().disconnect();
         BlocProvider.of<GetUserDataCubit>(context).userModel = null;
         UserPreferences.setUserToken("");
         BlocProvider.of<UserMoviesListCubit>(context).userMoviesList.clear();
        Navigator.pushReplacementNamed(context, RouteNames.loginScreen);
      },
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/icons/play.svg",
                width: 18,
                height: 18,
              ),
              const SizedBox(width: 10),
              const Text(
                "Play",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}

