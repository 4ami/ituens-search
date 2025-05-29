import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui/configuration/routing/app_router.dart';
import 'package:ui/utility/extensions/extensions_lib.dart';
import 'package:ui/utility/helpers/helpers_lib.dart';
import 'package:ui/utility/widgets/shared_widgets.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({super.key});

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.assets.error404, width: 500),
            Text(
              "Lost your way?",
              style: context.h1,
            ),
            SizedBox(height: 16),
            Text(
              "Oops! The page you're looking for isn't here.",
              textAlign: TextAlign.center,
              style: context.titleLarge,
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: 360,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Color(0xff4857FC)),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                  padding: WidgetStatePropertyAll(EdgeInsets.all(20)),
                  shape: WidgetStatePropertyAll(StadiumBorder()),
                ),
                onPressed: () => context.go(ApplicationPaths.landing.path),
                child: Text(
                  "Back to Home",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
