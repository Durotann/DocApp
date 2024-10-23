import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:doc_app/main.dart';
import 'package:doc_app/route_config/auto_route_config.gr.dart';
import 'package:doc_app/ui/splash_screen/bloc/bloc.dart';
import 'package:doc_app/ui/splash_screen/bloc/event.dart';
import 'package:doc_app/ui/splash_screen/bloc/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 1), () {
      context.router.push(const AuthRoute());
    });

    super.initState();
    print("asdasdsa");
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashScreenBloc, SplashScreenState>(
      listener: (context, state) {
        if (state.isTokenValid) {}
      },
      builder: (context, state) {
        return SvgPicture.asset("images/splash.svg");
      },
    );
  }
}
