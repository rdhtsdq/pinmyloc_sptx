part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class Login extends LoginEvent {
  final String? userid;
  final String? password;

  Login(this.userid, this.password);
}
