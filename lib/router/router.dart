import 'package:auto_route/auto_route.dart';
import 'package:linkstagram/router/router.gr.dart';
import 'package:linkstagram/screen/profile/profie_screen.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          path: '/authorization',
          page: AuthRoute.page,
          // initial: true, ---- change
        ),
        CupertinoRoute(
          path: '/signUP',
          page: SignUpRoute.page,
        ),
        CustomRoute(
          path: '/home',
          page: HomeRoute.page,
          initial: true,
        ),
        CustomRoute(
          path: '/profile',
          page: ProfileRoute.page,
        ),
      ];
}
