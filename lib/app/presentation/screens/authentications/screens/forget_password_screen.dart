import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/auth/forget_password_cubit/forget_password_cubit.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/auth/forget_password_cubit/forget_password_cubit.dart';
import 'package:netflix_app/app/core/theme/app_theme.dart';
import 'package:netflix_app/app/presentation/widgets/alert_dialog.dart';
import 'package:netflix_app/app/presentation/widgets/custom_button.dart';
import 'package:netflix_app/app/presentation/widgets/custom_snackbar.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final forgetPasswordCubit = BlocProvider.of<ForgetPasswordCubit>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is InvalidEmail) {
            customSnackBar(context, "Invalid email");
          }
          if (state is EmptyFieldRequired) {
            customSnackBar(context, "Empty field required");
          }
          if (state is EmailNotExist) {
            alertDialog(
              context: context,
              imagePath: "assets/images/icons/netflix-n.svg",
              title: "Email does not exist",
              subtitle: "Make sure you write the right email",
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: [
                  const Text(
                    "Password Reset",
                    style: TextStyle(fontSize: 18, color: AppTheme.smokeWhiteColor, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 22),
                  TextFormField(
                    focusNode: forgetPasswordCubit.focusNode,
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    controller: forgetPasswordCubit.emailController,
                    decoration: const InputDecoration(
                      labelText: "Enter your email",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  state is SendEmailResetLoading
                      ? const CircularProgressIndicator(color: AppTheme.redPrimaryColor)
                      : CustomButton(
                          width: 260,
                          color: AppTheme.redPrimaryColor,
                          function: () {
                            final result = forgetPasswordCubit.emailValidation(forgetPasswordCubit.emailController.text);
                            if (result) {
                              forgetPasswordCubit.focusNode.requestFocus(FocusNode());
                              forgetPasswordCubit.sendPasswordReset(forgetPasswordCubit.emailController.text);
                            }
                          },
                          child: const Text(
                            "Reset Password",
                            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
