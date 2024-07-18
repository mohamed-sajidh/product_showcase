import 'package:flutter/material.dart';
import 'package:product_showcase/controller/home_controller.dart';
import 'package:provider/provider.dart';

void showSuccessPopup(BuildContext context, homeNotifier, index) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('You have successfully purchased'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              homeNotifier.resetValues(index);
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
