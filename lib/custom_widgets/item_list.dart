// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemListContainer extends StatelessWidget {
  String title, body;
  ItemListContainer({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(title, style: TextStyle(fontWeight: FontWeight.bold),), Text(body)],
      ),
    );
  }
}
