import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'doctor_detail_event.dart';
part 'doctor_detail_state.dart';

class DoctorDetailBloc extends Bloc<DoctorDetailEvent, DoctorDetailState> {
  DoctorDetailBloc() : super(DoctorDetailInitial()) {
    on<DoctorDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
