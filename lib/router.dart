import 'package:code_check/page/pages.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',

  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
  ],
);