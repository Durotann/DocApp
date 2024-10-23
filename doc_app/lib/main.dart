import 'package:doc_app/route_config/auto_route_config.dart';
import 'package:doc_app/ui/splash_screen/bloc/bloc.dart';
import 'package:doc_app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashScreenBloc>(
          create: (BuildContext context) => SplashScreenBloc(),
        ),
      ],
      child: MaterialApp.router(
        theme: theme,
        routerConfig: appRouter.config(),
      ),
    );
  }
}
