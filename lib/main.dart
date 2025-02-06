import 'package:flutter/material.dart';

import 'app_routes.dart';

void main() {
  runApp(BreakingBadApp(
    appRoutes: AppRoutes(),
  ));
}

class BreakingBadApp extends StatelessWidget {
  final AppRoutes appRoutes;

  const BreakingBadApp({super.key, required this.appRoutes});

  @override
  Widget build(BuildContext context) {
    // توفير الـ Cubit في الـ MaterialApp بشكل عام
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRoutes.generateRoute,
    );
  }
}
