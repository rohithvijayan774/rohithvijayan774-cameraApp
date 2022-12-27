import 'dart:io';

import 'package:camera_app/functions/functions.dart';
import 'package:camera_app/screens/image_screen.dart';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

ValueNotifier<List> imageNotifierList = ValueNotifier([]);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final imagePick = ImagePicker();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Camera'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pickImage();
        },
        child: const Icon(Icons.camera_alt_outlined),
      ),
      body: ValueListenableBuilder(
        valueListenable: imageNotifierList,
        builder: ((BuildContext context, List data, Widget? _) {
          if (data.isEmpty) {
            return const Center(
              child: Text('No Photos'),
            );
          }
          return GridView.builder(
            itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 3, crossAxisSpacing: 3),
            itemBuilder: (BuildContext context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImageScreen(img: data[index]),
                    ),
                  );
                },
                child: Hero(
                  tag: index,
                  child: Image(
                    fit: BoxFit.fill,
                    image: FileImage(
                      File(data[index]),
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
