import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Product Showcase"),
        ),
      ),
      body: Container(
        height: 50,
        width: 100,
        color: Colors.red,
      ),
    );
  }
}
