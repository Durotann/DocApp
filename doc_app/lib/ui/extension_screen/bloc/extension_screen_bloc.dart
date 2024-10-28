import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'extension_screen_event.dart';
part 'extension_screen_state.dart';

class ExtensionScreenBloc extends Bloc<ExtensionScreenEvent, ExtensionScreenState> {
  ExtensionScreenBloc() : super(ExtensionScreenInitial()) {
    on<ExtensionScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
