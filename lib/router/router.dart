import 'package:auto_route/auto_route.dart';
import 'package:linkstagram/router/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          path: '/authorization',
          page: AuthRoute.page,
          initial: true,
        ),
        CustomRoute(
          path: '/signUP',
          page: SignUpRoute.page,
        ),
        CupertinoRoute(
          path: '/home',
          page: HomeRoute.page,
        ),
        CupertinoRoute(
          path: '/profile',
          page: ProfileRoute.page,
        ),
        CupertinoRoute(
          path: '/editProfile',
          page: EditProfileRoute.page,
        ),
        CupertinoRoute(
          path: '/addPost',
          page: AddPostRoute.page,
        ),
      ];
}
