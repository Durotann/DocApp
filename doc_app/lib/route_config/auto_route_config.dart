import 'package:auto_route/auto_route.dart';
import 'package:doc_app/route_config/auto_route_config.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: SplashRoute.page,
        ),
        CustomRoute(
          page: AuthRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 400,
        ),
        CustomRoute(
          page: ForgotPasswordRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 400,
        ),
        CustomRoute(
          page: VerificationCodeRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 400,
        ),
        CustomRoute(
          page: ResetPasswordRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 400,
        ),
        AutoRoute(
          page: HomeRoute.page,
          children: [
            AutoRoute(page: MainRoute.page),
            AutoRoute(page: SearchRoute.page),
            AutoRoute(page: NotificationRoute.page),
            AutoRoute(page: ExtensionRoute.page),
          ],
        ),
      ];
}
