import 'package:flutter/material.dart';

class NextScreen extends StatelessWidget {
  static String route = '/next';
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Secrren')),
      body: const Center(child: Text('Scaffold Body')),
    );
  }
}
