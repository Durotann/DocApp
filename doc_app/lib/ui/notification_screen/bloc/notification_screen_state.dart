part of 'notification_screen_bloc.dart';

sealed class NotificationScreenState extends Equatable {
  const NotificationScreenState();
  
  @override
  List<Object> get props => [];
}

final class NotificationScreenInitial extends NotificationScreenState {}
