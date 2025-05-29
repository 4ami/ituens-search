part of '../app_router.dart';

final class _LandingRoute extends _BaseRoute {
  const _LandingRoute();

  @override
  GoRoute get route => GoRoute(
    path: ApplicationPaths.landing.path,
    name: ApplicationPaths.landing.name,
    builder: (context, state) {
      return BlocProvider(
        create: (context) => LandingBloc(),
        child: const LandingPage(),
      );
    },
  );

  @override
  Future<String?> redirect(BuildContext context, GoRouterState state) async {
    return null;
  }
}
