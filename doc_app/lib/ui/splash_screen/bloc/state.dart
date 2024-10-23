import 'package:equatable/equatable.dart';

class SplashScreenState extends Equatable {
  final String character;
  final bool isTokenValid;

  const SplashScreenState({
    this.character = "",
    this.isTokenValid = true,
  });

  SplashScreenState copyWith({
    String? character,
    bool? isTokenValid,
  }) {
    return SplashScreenState(
      character: character ?? this.character,
      isTokenValid: isTokenValid ?? this.isTokenValid,
    );
  }

  SplashScreenState initial() => const SplashScreenState();

  @override
  List<Object?> get props => [
        character,
        isTokenValid,
      ];
}
