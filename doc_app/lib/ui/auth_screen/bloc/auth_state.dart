part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final String name;
  const AuthState({this.name = ""});

  AuthState copyWith({
    String? name,
  }) {
    return AuthState(name: name ?? this.name);
  }

  AuthState initial() => const AuthState();

  @override
  List<Object?> get props => [];
}
