import 'package:code_check/page/searched_list.dart';
import 'package:code_check/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: const Center(
        child: Text('Home Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>context.push(RoutePathName.list),
        child: const Icon(Icons.search),
      ),
    );
  }
}