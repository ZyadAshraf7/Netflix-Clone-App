import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/auth/register_cubit/register_cubit.dart';
import 'package:netflix_app/app/core/constants/route_names.dart';
import 'package:netflix_app/app/core/theme/app_theme.dart';
import 'package:netflix_app/app/presentation/screens/authentications/screens/email_verfifcation_screen.dart';
import 'package:netflix_app/app/presentation/screens/authentications/screens/widgets/custom_text_form_field.dart';
import 'package:netflix_app/app/presentation/widgets/alert_dialog.dart';
import 'package:netflix_app/app/presentation/widgets/custom_button.dart';
import 'package:netflix_app/app/presentation/widgets/custom_snackbar.dart';
import 'widgets/does_have_account.dart';
import 'widgets/separator.dart';
import 'widgets/social_media_login.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is SendEmailVerification) {
            Navigator.pushNamed(context, RouteNames.emailVerificationScreen);
          }
          if (state is RegisterWeakPassword) {
            customSnackBar(context, "Weak Password");
          }
          if (state is RegisterInvalidEmail) {
            customSnackBar(context, "Invalid Email");
          }
          if (state is PasswordsNotMatching) {
            customSnackBar(context, "Passwords Don't Match");
          }
          if (state is RegisterEmptyField) {
            customSnackBar(context, "Empty Field Required");
          }
          if (state is EmailExistAndUserVerified) {
            alertDialog(context: context, title: "Email already exist", subtitle: "You can Sign in");
          }
          if (state is EmailExistAndUserNotVerified) {
            alertDialog(
              context: context,
              imagePath: "assets/images/icons/netflix-n.svg",
              title: "Email is not verified yet",
              subtitle: "Please check your email for verification link",
              hasButton: true,
              buttonOnTap: () => Navigator.of(context).pop(),
              buttonTitle: "Done",
            );
          }
        },
        builder: (context, state) {
          final registerCubit = BlocProvider.of<RegisterCubit>(context);
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
                    gradient: LinearGradient(
                      colors: [Colors.black87, Colors.black87],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Center(
                  child: Form(
                    key: registerCubit.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 16),
                        SvgPicture.asset(
                          "assets/images/NetflixLogo.svg",
                          height: 70,
                          width: 272,
                          color: AppTheme.redPrimaryColor,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Signup",
                          style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 28),
                        CustomTextFormField(
                          focusNode: registerCubit.emailFocusNode,
                          hintText: "Email Address",
                          title: "Email",
                          isPasswordField: false,
                          textEditingController: registerCubit.emailController,
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          focusNode: registerCubit.passwordFocusNode,
                          hintText: "Password",
                          title: "Password",
                          isPasswordVisible: registerCubit.isPasswordVisible,
                          isPasswordField: true,
                          textEditingController: registerCubit.passwordController,
                          changePasswordVisibility: registerCubit.changePasswordVisibility,
                        ),
                        const SizedBox(height: 17),
                        CustomTextFormField(
                          focusNode: registerCubit.confirmPasswordFocusNode,
                          hintText: "Confirm Password",
                          title: "Confirm Password",
                          isPasswordVisible: registerCubit.isRePasswordVisible,
                          isPasswordField: true,
                          textEditingController: registerCubit.rePasswordController,
                          changePasswordVisibility: registerCubit.changeRePasswordVisibility,
                        ),
                        const SizedBox(height: 35),
                        state is RegisterLoading
                            ? const CircularProgressIndicator(
                                color: AppTheme.redPrimaryColor,
                              )
                            : CustomButton(
                                function: () {
                                  final validationResult = registerCubit.validateForm();
                                  if (validationResult) {
                                    registerCubit.emailFocusNode.requestFocus(FocusNode());
                                    registerCubit.passwordFocusNode.requestFocus(FocusNode());
                                    registerCubit.confirmPasswordFocusNode.requestFocus(FocusNode());
                                    BlocProvider.value(
                                      value: registerCubit,
                                      child: const EmailVerificationScreen(),
                                    );
                                    registerCubit.registerUser(
                                      email: registerCubit.emailController.text,
                                      password: registerCubit.passwordController.text,
                                    );
                                  }
                                },
                                child: const Text(
                                  "Signup",
                                  style: TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ),
                        const SizedBox(height: 17),
                        separator(),
                        const SizedBox(height: 17),
                        const SocialMediaLogin(),
                        const SizedBox(height: 17),
                        doesHaveAccount(
                          title: "Already Have An Account?  ",
                          subtitle: "Login",
                          function: () {
                            Navigator.of(context).pushReplacementNamed(RouteNames.loginScreen);
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
