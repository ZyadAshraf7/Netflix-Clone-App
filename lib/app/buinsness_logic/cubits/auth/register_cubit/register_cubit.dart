import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:netflix_app/app/core/constants/route_names.dart';
import 'package:netflix_app/app/data/repositories/authentication/email_verification_repository.dart';
import 'package:netflix_app/app/data/repositories/authentication/register_repository.dart';
import 'package:netflix_app/app/data/shared_preference/user_preference.dart';
import 'package:netflix_app/app/presentation/widgets/alert_dialog.dart';
import 'package:netflix_app/app/presentation/widgets/custom_snackbar.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.registerRepository}) : super(RegisterInitial());
  RegisterRepository registerRepository;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPasswordVisible = true;
  bool isRePasswordVisible = true;
  bool valid = true;
  late String oobCode;

  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(ChangePasswordVisibility());
  }

  void changeRePasswordVisibility() {
    isRePasswordVisible = !isRePasswordVisible;
    emit(ChangePasswordVisibility());
  }


  bool validateForm() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty || rePasswordController.text.isEmpty) {
      //valid = false;
      //customSnackBar(context, "Empty Field Required");
      emit(RegisterEmptyField());
      return false;
    }
    if (passwordController.text != rePasswordController.text) {
      // valid = false;
      // customSnackBar(context, "Passwords Don't Match");
      emit(PasswordsNotMatching());
      return false;
    }
    if (!emailController.text.contains('@')) {
      //  valid = false;
      // customSnackBar(context, "Invalid Email");
      emit(RegisterInvalidEmail());
      return false;
    }
    if (passwordController.text.length < 6) {
      //valid = false;
      // customSnackBar(context, "Weak Password");
      emit(RegisterWeakPassword());
      return false;
    }
    return true;
  }

  Future<void> registerUser({String? email, String? password,}) async {

    emit(RegisterLoading());
    try {
      final data = await registerRepository.registerUser(email!, password!);
      emit(RegisterLoading());
      if (data['idToken'] != null) {
        print("register success");
        final token = data['idToken'];

        final userEmail = data['email'];
        UserPreferences.setUserToken(token);
        UserPreferences.setUserEmail(userEmail);
        print("token and email saved");
        emit(SendEmailVerification());
        //print("token is => ${UserPreferences.getUserToken()}");
        sendEmailVerification();

      } else {
        print(data['error']['message']);
        final isVerified = await registerRepository.confirmEmailVerification(email, password);
        if(data['error']['message']=="EMAIL_EXISTS"&&isVerified==true){
          emit(EmailExistAndUserVerified());
        }else if(data['error']['message']=="EMAIL_EXISTS"&&isVerified==false){
          emit(EmailExistAndUserNotVerified());
          Future.delayed(Duration.zero).then((value){
            //emit(SendEmailVerification());
            sendEmailVerification();
          });
        }
        emit(RegisterError());
        print("error occurs");
        print(data.body.toString());
      }
      print(data);
    } catch (e) {
      emit(RegisterError());
      print("error in Register cubit");
      print(e.toString());
    }
  }
  
    void sendEmailVerification()async{
    try {
      final data = await registerRepository.sendEmailVerification();
      print("data is $data");
      if(data['email']!=null){
        print("confirm email sent successfully");
      }else{
        print("confirm email does not sent");
      }
    }catch(e){
      print("error in send confirmation email");
      print(e.toString());
    }
  }
  Future<bool>confirmEmailVerification({required String email,required String password,required BuildContext context})async{
    try {
      emit(RegisterLoading());
      final data = await registerRepository.confirmEmailVerification(email,password);
      if(data==true){
        print("email is verified");
        UserPreferences.setUserVerification(true);
        alertDialog(
            context: context,
            imagePath: "assets/images/icons/netflix-n.svg",
            title: "Email is verified successfully",
            hasButton: true,
            buttonOnTap: () => Navigator.of(context).pop(),
            buttonTitle: "Done"
        ).then((value) {
          Navigator.pushReplacementNamed(context, RouteNames.home);
        });
        emit(EmailVerifiedSuccessfully());
        return true;
      }else{
        print("email is not verified");
        emit(EmailNotVerified());
        return false;
      }
    }catch(e){
      print("email is not verified");
      print(e.toString());
      emit(EmailNotVerified());
      return false;
    }
  }

  void init() {
    formKey = GlobalKey<FormState>();
  }
}
