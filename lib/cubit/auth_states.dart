import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  final bool? isLoading;
  const AuthState({required this.isLoading});
}


class AuthWelcomeState extends AuthState{
  const AuthWelcomeState({
    required super.isLoading
  });

  @override
  // TODO: implement props
  List<Object?> get props => [isLoading];
}


class AuthLoginState extends AuthState{
  const AuthLoginState({
    required super.isLoading
  });

  @override
  // TODO: implement props
  List<Object?> get props => [isLoading];
}

class AuthRegisterState extends AuthState{
  const AuthRegisterState({required super.isLoading});

  @override
  // TODO: implement props
  List<Object?> get props => [isLoading];
}


class AuthCompleteState extends AuthState{
  const AuthCompleteState({required super.isLoading});

  @override
  // TODO: implement props
  List<Object?> get props => [isLoading];
}