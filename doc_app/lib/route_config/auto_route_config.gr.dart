// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:doc_app/ui/auth_screen/presentation/auth_screen.dart' as _i1;
import 'package:doc_app/ui/bottom_navigation_bar/bottom_navigation_bar.dart'
    as _i4;
import 'package:doc_app/ui/extension_screen/presentation/extension_screen.dart'
    as _i2;
import 'package:doc_app/ui/forgot_password_screen/presentation/forgot_password_screen.dart'
    as _i3;
import 'package:doc_app/ui/forgot_password_screen/presentation/verification_code_screen.dart'
    as _i9;
import 'package:doc_app/ui/main_screen/presentation/main_screen.dart' as _i5;
import 'package:doc_app/ui/notification_screen/presentation/notification_screen.dart'
    as _i6;
import 'package:doc_app/ui/search_screen/presentation/search_screen.dart'
    as _i7;
import 'package:doc_app/ui/splash_screen/presentation/splash_screen.dart'
    as _i8;
import 'package:flutter/material.dart' as _i11;

/// generated route for
/// [_i1.AuthScreen]
class AuthRoute extends _i10.PageRouteInfo<AuthRouteArgs> {
  AuthRoute({
    _i11.Key? key,
    required bool isSignUp,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          AuthRoute.name,
          args: AuthRouteArgs(
            key: key,
            isSignUp: isSignUp,
          ),
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AuthRouteArgs>();
      return _i1.AuthScreen(
        key: args.key,
        isSignUp: args.isSignUp,
      );
    },
  );
}

class AuthRouteArgs {
  const AuthRouteArgs({
    this.key,
    required this.isSignUp,
  });

  final _i11.Key? key;

  final bool isSignUp;

  @override
  String toString() {
    return 'AuthRouteArgs{key: $key, isSignUp: $isSignUp}';
  }
}

/// generated route for
/// [_i2.ExtensionScreen]
class ExtensionRoute extends _i10.PageRouteInfo<void> {
  const ExtensionRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ExtensionRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExtensionRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i2.ExtensionScreen();
    },
  );
}

/// generated route for
/// [_i3.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i10.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i3.ForgotPasswordScreen();
    },
  );
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomeScreen();
    },
  );
}

/// generated route for
/// [_i5.MainScreen]
class MainRoute extends _i10.PageRouteInfo<void> {
  const MainRoute({List<_i10.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i5.MainScreen();
    },
  );
}

/// generated route for
/// [_i6.NotificationScreen]
class NotificationRoute extends _i10.PageRouteInfo<void> {
  const NotificationRoute({List<_i10.PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i6.NotificationScreen();
    },
  );
}

/// generated route for
/// [_i7.SearchScreen]
class SearchRoute extends _i10.PageRouteInfo<void> {
  const SearchRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i7.SearchScreen();
    },
  );
}

/// generated route for
/// [_i8.SplashScreen]
class SplashRoute extends _i10.PageRouteInfo<void> {
  const SplashRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i8.SplashScreen();
    },
  );
}

/// generated route for
/// [_i9.VerificationCodeScreen]
class VerificationCodeRoute extends _i10.PageRouteInfo<void> {
  const VerificationCodeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          VerificationCodeRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerificationCodeRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i9.VerificationCodeScreen();
    },
  );
}
