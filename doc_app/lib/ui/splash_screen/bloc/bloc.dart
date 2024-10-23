import 'package:doc_app/ui/splash_screen/bloc/event.dart';
import 'package:doc_app/ui/splash_screen/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(const SplashScreenState().initial()) {}
}
