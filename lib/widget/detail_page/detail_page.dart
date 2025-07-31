import 'package:code_check/widget/widget.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarForDetailPage(),
      body: const Center(
        child: Text('Detail Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action for the floating action button
        },
        child: const Icon(Icons.info),
      ),
    );
  }
}