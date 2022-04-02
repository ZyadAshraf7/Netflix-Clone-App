import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/auth/login_cubit/login_cubit.dart';
import 'package:netflix_app/app/core/constants/route_names.dart';
import 'package:netflix_app/app/core/theme/app_theme.dart';
import 'package:netflix_app/app/presentation/widgets/custom_button.dart';

class SocialMediaLogin extends StatelessWidget {
  const SocialMediaLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 310,
      child: Center(
        child: CustomButton(
          width: 250,
          color: AppTheme.smokeWhiteColor,
          function: () {
            BlocProvider.of<LoginCubit>(context).signInWithGoogle().then((value) {
              Navigator.pushReplacementNamed(context, RouteNames.bottomNavBarScreen);
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/images/icons/google-icon.svg",
                  width: 24,
                  height: 26,
                ),
                const SizedBox(width: 24),
                Text(
                  "Continue with google",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
