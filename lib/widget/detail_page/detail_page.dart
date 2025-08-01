import 'package:code_check/widget/widget.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarForDetailPage(),
      body: Center(child: Text('Detail Page: ${id.toString()} ')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action for the floating action button
        },
        child: const Icon(Icons.info),
      ),
    );
  }
}
