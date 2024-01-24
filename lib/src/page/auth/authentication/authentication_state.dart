import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUninitialized';
}

class AuthenticationAuthenticated extends AuthenticationState {
  @override
  String toString() => 'AuthenticationAuthenticated';
}

class AuthenticationUnauthenticated extends AuthenticationState {
  @override
  String toString() {
    return 'AuthenticationUnauthenticated';
  }
}

class AuthenticationUninitialized extends AuthenticationState {
  @override
  String toString() {
    return 'AuthenticationUninitialized';
  }
}

class AuthenticationLogin extends AuthenticationState {
  @override
  String toString() => 'AuthenticationLogin';
}

class AuthenticationSignUp extends AuthenticationState {
  @override
  String toString() => 'AuthenticationSignUp';
}

class AuthenticationLoading extends AuthenticationState {
  @override
  String toString() => 'AuthenticationLoading';
}

class AuthenticationOnBoarding extends AuthenticationState {
  @override
  String toString() => 'AuthenticationOnBoarding';
}
