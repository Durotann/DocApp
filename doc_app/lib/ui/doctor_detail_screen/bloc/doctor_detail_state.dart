part of 'doctor_detail_bloc.dart';

sealed class DoctorDetailState extends Equatable {
  const DoctorDetailState();
  
  @override
  List<Object> get props => [];
}

final class DoctorDetailInitial extends DoctorDetailState {}
