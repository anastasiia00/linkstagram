import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkstagram/blocs/cubit/app_cubit.dart';
import 'package:linkstagram/responsive/responsive_layout_screen.dart';

import 'layouts/mobile.dart';
import 'layouts/web.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (state is AppLoading) {
          return const Material(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return const ResponsiveLayout(
          webScreenLayout: AuthWebLayout(),
          mobileScreenLayout: AuthMobileLayout(),
        );
      },
    );
  }
}
