import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/auth/register_cubit/register_cubit.dart';
import 'package:netflix_app/app/core/constants/route_names.dart';
import 'package:netflix_app/app/core/theme/app_theme.dart';
import 'package:netflix_app/app/presentation/widgets/alert_dialog.dart';
import 'package:netflix_app/app/presentation/widgets/custom_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerCubit = BlocProvider.of<RegisterCubit>(context);
    return Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is EmailNotVerified) {
            alertDialog(
              context: context,
              imagePath: "assets/images/icons/netflix-n.svg",
              title: "Email is not verified yet",
              subtitle: "please check your email",
              hasButton: true,
              buttonOnTap: () => Navigator.of(context).pop(),
              buttonTitle: "Done",
            );
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/NetflixLogo.svg",
                  color: AppTheme.redPrimaryColor,
                  height: 70,
                  width: 272,
                ),
                const SizedBox(height: 80),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Email verification is sent to your email\n",
                      style: TextStyle(color: AppTheme.smokeWhiteColor, fontSize: 16),
                    ),
                    Text(
                      registerCubit.emailController.text,
                      style: const TextStyle(color: AppTheme.smokeWhiteColor, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 36),
                state is RegisterLoading
                    ? const CircularProgressIndicator(
                        color: AppTheme.redPrimaryColor,
                      )
                    : CustomButton(
                        function: () async {
                          final result = await registerCubit.confirmEmailVerification(
                            email: registerCubit.emailController.text,
                            password: registerCubit.passwordController.text,
                            context: context,
                          );
                          if (result == true) {
                            print("==>> email is verified");
                          } else {
                            print("==>> email is NOOOT verified");
                          }
                        },
                        child: const Text(
                          "Verify",
                          style: TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        width: 280,
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
