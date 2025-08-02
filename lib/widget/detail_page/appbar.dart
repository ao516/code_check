import 'package:flutter/material.dart';

class AppBarForDetailPage extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  
  const AppBarForDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar();
  }
}