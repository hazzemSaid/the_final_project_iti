part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

//sginin sgin up
class SginInLoading extends AuthState {}

class SginInSuccess extends AuthState {}

class SginInFailed extends AuthState {}

class SginUpLoading extends AuthState {}

class SginUpSuccess extends AuthState {}

class SginUpFailed extends AuthState {}

//forgot password
class ForgotPasswordLoading extends AuthState {}

class ForgotPasswordSuccess extends AuthState {}

class ForgotPasswordFailed extends AuthState {}

//google sginin
class GoogleSginInLoading extends AuthState {}

class GoogleSginInSuccess extends AuthState {}

class GoogleSginInFailed extends AuthState {}

//phone sginin
class PhoneSginInLoading extends AuthState {}

class PhoneSginInSuccess extends AuthState {}

class PhoneSginInFailed extends AuthState {}
