import 'package:code_check/page/pages.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: RoutePathName.home,

  routes: [
    GoRoute(
      path: RoutePathName.home,
      name: RoutePathName.homeName,
      builder: (context, state) => const HomePage(),
    ),

    GoRoute(
      path: RoutePathName.detail,
      name: RoutePathName.detailName,
      builder: (context, state) => const DetailPage(),
    ),

    GoRoute(
      path: RoutePathName.list,
      name: RoutePathName.listName,
      builder: (context, state) => const ListPage(),
    ),
  ],
);

class RoutePathName {
  RoutePathName._();

  static const String home = '/';
  static const String detail = '/detail';
  static const String list = '/list';

  static const String homeName = 'home';
  static const String detailName = 'detail';
  static const String listName = 'list';
}