import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/configuration/routing/app_router.dart';
import 'package:ui/configuration/theme/theme_lib.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ThemeModeCubit())],
      child: MaterialApp.router(
        title: 'iTunes Search',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.instance.lightMode(''),
        darkTheme: AppTheme.instance.darkMode(''),
        routerConfig: AppRouter.instance.router,
      ),
    );
  }
}
