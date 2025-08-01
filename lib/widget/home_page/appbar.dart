import 'package:code_check/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarForHomePage extends StatelessWidget implements PreferredSizeWidget {

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  const AppBarForHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () => const SearchRoute().go(context),
        ),
      ],
    );
  }
}