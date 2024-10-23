import 'package:equatable/equatable.dart';

class SplashScreenState extends Equatable {
  final String character;

  const SplashScreenState({
    this.character = "",
  });

  SplashScreenState copyWith({
    String? character,
  }) {
    return SplashScreenState(
      character: character ?? this.character,
    );
  }

  SplashScreenState initial() => SplashScreenState();

  @override
  List<Object?> get props => [];
}
