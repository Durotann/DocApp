import 'package:doc_app/ui/splash_screen/bloc/bloc.dart';
import 'package:doc_app/ui/splash_screen/bloc/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: BlocListener<SplashScreenBloc, SplashScreenState>(
        listener: (context, state) {},
        child: Builder(builder: (ctx) {
          final character = ctx.select(
            (SplashScreenState state) => state.character,
          );
          return Container();
        }),
      )),
    );
  }
}
