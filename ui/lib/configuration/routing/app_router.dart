library;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ui/feature/error/view.dart';
import 'package:ui/feature/landing/bloc/bloc.dart';
import 'package:ui/feature/landing/landing_lib.dart';

part '_routes/_base_route.dart';
part '_routes/_landing_route.dart';


final class RouteObject {
  const RouteObject({required this.path, required this.name});
  final String path, name;
}

final class ApplicationPaths {
  static RouteObject get landing => RouteObject(path: '/', name: 'landing');
}

class AppRouter {
  const AppRouter._();

  static final AppRouter _i = AppRouter._();
  static AppRouter get instance => _i;

  GoRouter get router {
    return GoRouter(
      initialLocation: ApplicationPaths.landing.path,
      errorPageBuilder: (context, state) {
        return MaterialPage(child: ErrorPage());
      },
      redirect: _redirect,
      routes: [
        _LandingRoute().route,
      ],
    );
  }

  Future<String?> _redirect(BuildContext context, GoRouterState state) async {
    return null;
  }
}
