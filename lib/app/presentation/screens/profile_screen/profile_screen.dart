import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/get_user_data/get_user_data_cubit.dart';
import 'package:netflix_app/app/core/constants/route_names.dart';
import 'package:netflix_app/app/core/theme/app_theme.dart';
import 'package:netflix_app/app/data/models/user.dart';
import 'package:netflix_app/app/data/shared_preference/user_preference.dart';
import 'package:netflix_app/app/presentation/screens/profile_screen/widgets/profile_icon_box.dart';

import '../../../buinsness_logic/cubits/user_movies_list/user_movies_list_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileCubit = BlocProvider.of<GetUserDataCubit>(context);

    return BlocBuilder<GetUserDataCubit, GetUserDataState>(
      builder: (context, state) {
        if (state is LoadingUserData) {
          return const Center(
              child: CircularProgressIndicator(
            color: AppTheme.redPrimaryColor,
          ));
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      image: profileCubit.userModel?.photoUrl == ""
                          ? const DecorationImage(
                              image: AssetImage("assets/images/child2.png"),
                              fit: BoxFit.cover,
                            )
                          : DecorationImage(
                              image: NetworkImage("${profileCubit.userModel?.photoUrl}"),
                              fit: BoxFit.cover,
                            ),
                      borderRadius: const BorderRadius.all(Radius.circular(80.0)),
                      border: Border.all(
                        color: AppTheme.redPrimaryColor,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    profileCubit.userModel!.userName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      profileCubit.userModel!.email,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 3),
                    SvgPicture.asset(
                      "assets/images/icons/verified-badge.svg",
                      height: 20,
                      width: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                ProfileIconBox(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.userMoviesListScreen);
                  },
                  iconPath: "assets/images/icons/addedToList.svg",
                  title: "My List",
                ),
                const SizedBox(height: 10),
                Divider(
                  color: Colors.white.withOpacity(0.6),
                  thickness: 1,
                ),
                const SizedBox(height: 18),
                ProfileIconBox(
                  onTap: () {},
                  iconPath: "assets/images/icons/info.svg",
                  title: "About the App",
                ),
                const SizedBox(height: 26),
                ProfileIconBox(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    GoogleSignIn().disconnect();
                    BlocProvider.of<GetUserDataCubit>(context).userModel = null;
                    UserPreferences.setUserToken("");
                    BlocProvider.of<UserMoviesListCubit>(context).userMoviesList.clear();
                    Navigator.pushReplacementNamed(context, RouteNames.loginScreen);
                  },
                  iconPath: "assets/images/icons/logout.svg",
                  title: "Sign Out",
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
