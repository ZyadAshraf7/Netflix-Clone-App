part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterError extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterEmptyField extends RegisterState {}

class RegisterInvalidEmail extends RegisterState {}

class RegisterWeakPassword extends RegisterState {}

class PasswordsNotMatching extends RegisterState {}

class ChangePasswordVisibility extends RegisterState {}

class SendEmailVerification extends RegisterState {}

class EmailVerifiedSuccessfully extends RegisterState {}

class EmailNotVerified extends RegisterState {}
class EmailExistAndUserVerified extends RegisterState {}
class EmailExistAndUserNotVerified extends RegisterState {}

