part of 'forget_password_cubit.dart';

@immutable
abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class SendEmailResetLoading extends ForgetPasswordState {}

class SendEmailResetSuccess extends ForgetPasswordState {}

class SendEmailResetError extends ForgetPasswordState {}
class EmailNotExist extends ForgetPasswordState {}

class InvalidEmail extends ForgetPasswordState {}
class EmptyFieldRequired extends ForgetPasswordState {}
