import 'dart:io';

import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  final String img;
  const ImageScreen({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    final File image = File(img);
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.info_outline),
          ),
        ],
      ),
      body: Center(
        child: Image.file(image),
      ),
    );
  }
}
