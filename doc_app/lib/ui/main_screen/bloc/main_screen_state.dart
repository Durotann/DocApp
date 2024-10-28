part of 'main_screen_bloc.dart';

sealed class MainScreenState extends Equatable {
  const MainScreenState();
  
  @override
  List<Object> get props => [];
}

final class MainScreenInitial extends MainScreenState {}
