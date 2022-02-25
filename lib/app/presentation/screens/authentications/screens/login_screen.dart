import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/auth/login_cubit/login_cubit.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/auth/register_cubit/register_cubit.dart';
import 'package:netflix_app/app/core/constants/route_names.dart';

import 'package:netflix_app/app/core/theme/app_theme.dart';
import 'package:netflix_app/app/presentation/screens/authentications/screens/widgets/custom_text_form_field.dart';
import 'package:netflix_app/app/presentation/widgets/alert_dialog.dart';
import 'package:netflix_app/app/presentation/widgets/custom_button.dart';
import 'package:netflix_app/app/presentation/widgets/custom_snackbar.dart';
import 'widgets/does_have_account.dart';
import 'widgets/separator.dart';
import 'widgets/social_media_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacementNamed(context, RouteNames.home);
          }
          if (state is UserIsNotVerified) {
            alertDialog(
              context: context,
              imagePath: "assets/images/icons/netflix-n.svg",
              title: "Email is not verified yet",
              subtitle: "please check your email",
              hasButton: true,
              buttonOnTap: () => Navigator.of(context).pop(),
              buttonTitle: "Done",
            ).then((value) {
              BlocProvider.of<RegisterCubit>(context).sendEmailVerification();
            });
          }
          if(state is LoginEmptyField){
            customSnackBar(context, "Empty Field Required");
          }
          if (state is LoginInvalidEmail){
            customSnackBar(context, "Invalid Email");
          }
          if(state is EmailNotFound){
            customSnackBar(context, "Email Not Exist");
          }
          if(state is InvalidPassword){
            customSnackBar(context, "Invalid Password");
          }
          if(state is LoginWeakPassword){
            customSnackBar(context, "Password Must be at Least 6 Characters");
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/images/backgroundImages.png",
                  width: size.width,
                  height: size.height,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: size.width,
                  height: size.height,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.black87, Colors.black87], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  ),
                ),
                Center(
                  child: Form(
                    key: loginCubit.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/NetflixLogo.svg",
                          height: 70,
                          width: 272,
                          color: AppTheme.redPrimaryColor,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 28),
                        CustomTextFormField(
                          focusNode: loginCubit.emailFocusNode,
                          hintText: "Email Address",
                          title: "Email",
                          isPasswordField: false,
                          textEditingController: loginCubit.emailController,
                        ),
                        const SizedBox(height: 17),
                        CustomTextFormField(
                          focusNode: loginCubit.passwordFocusNode,
                          hintText: "Password",
                          title: "Password",
                          isPasswordVisible: loginCubit.isPasswordVisible,
                          isPasswordField: true,
                          textEditingController: loginCubit.passwordController,
                          changePasswordVisibility: loginCubit.changePasswordVisibility,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, RouteNames.forgetPasswordScreen);
                              },
                              child: const Text(
                                "Forgot Password ?",
                                style: TextStyle(fontSize: 13, color: AppTheme.greyColor),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),
                        if (state is LoginLoading)
                          const CircularProgressIndicator(color: AppTheme.redPrimaryColor)
                        else
                          CustomButton(
                            function: () {
                              final validationResult = loginCubit.loginValidation();
                              if (validationResult) {
                                loginCubit.emailFocusNode.requestFocus(FocusNode());
                                loginCubit.passwordFocusNode.requestFocus(FocusNode());
                                loginCubit.loginUser(
                                  email: loginCubit.emailController.text,
                                  password: loginCubit.passwordController.text,
                                );
                              }
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        const SizedBox(height: 20),
                        separator(),
                        const SizedBox(height: 20),
                        const SocialMediaLogin(),
                        const SizedBox(height: 25),
                        doesHaveAccount(
                          title: "Don’t Have An Account?  ",
                          subtitle: "Sign Up",
                          function: () {
                            Navigator.of(context).pushNamed(RouteNames.registerScreen);
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
