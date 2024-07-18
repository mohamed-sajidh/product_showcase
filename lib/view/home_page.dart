import 'package:flutter/material.dart';
import 'package:product_showcase/view/widgets/single_product_viewer.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return const SingleProductViewer();
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 10,
        ),
      ),
    );
  }
}
