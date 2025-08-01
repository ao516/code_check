import 'package:code_check/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'router.g.dart';

final router = GoRouter(
  routes: $appRoutes,
  initialLocation: const HomeRoute().location,
  errorBuilder: (context, state) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(child: Text('Error: ${state.error}')),
    );
  },
);

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: [
    TypedGoRoute<DetailRoute>(path: 'detail/:id'),
    TypedGoRoute<SearchRoute>(path: 'search'),
  ]
)

class HomeRoute extends GoRouteData with _$HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

class DetailRoute extends GoRouteData with _$DetailRoute {
  const DetailRoute({required this.id});
  final int id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DetailPage(id: id);
  }
}

class SearchRoute extends GoRouteData with _$SearchRoute {
  const SearchRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SearchPage();
}