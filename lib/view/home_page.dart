import 'package:flutter/material.dart';
import 'package:product_showcase/controller/home_controller.dart';
import 'package:product_showcase/view/widgets/single_product_viewer.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeNotifier = Provider.of<HomeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Product Showcase"),
        ),
      ),
      body: Consumer<HomeNotifier>(
        builder: (context, homeNotifier, child) {
          if (homeNotifier.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (homeNotifier.product.isEmpty) {
            return Center(child: Text('No products available.'));
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return SingleProductViewer(index: index);
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: homeNotifier.product.length,
              ),
            );
          }
        },
      ),
      );
  }
}
