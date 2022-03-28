import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class TestPage extends StatefulWidget {
  static const path = "testing";
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  File? image;
  Future pickImage(ImageSource imagesource) async {
    try {
      final image = await ImagePicker().pickImage(source: imagesource);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print("Failed to get imes : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            image == null
                ? const SizedBox()
                : SizedBox(
                    width: 50,
                    height: 80,
                    child: Image.file(image!),
                  ),
            TextButton(
                onPressed: () {
                  pickImage(ImageSource.gallery);
                },
                child: const Text("Select from Gallery")),
            TextButton(
                onPressed: () {
                  pickImage(ImageSource.camera);
                },
                child: const Text("Select from Camera")),
          ],
        ),
      ),
    );
  }
}
