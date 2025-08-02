import 'package:code_check/router.dart';
import 'package:code_check/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarForHomePage(),
      body: const Center(
        child: Text('Home Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>const SearchRoute().go(context),
        child: const Icon(Icons.search),
      ),
    );
  }
}