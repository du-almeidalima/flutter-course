import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  void _takePicture() async {
    final picker = ImagePicker();
    final imageFile = picker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
  }

  Widget buildImagePreviewOrText(File image) {
    return image != null
        ? Image.file(
            image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          )
        : Center(
            child: Text(
              'Take a Photo!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(1),
            height: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.indigo,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Stack(
              children: [
                this.buildImagePreviewOrText(this._storedImage),
                Align(
                  alignment: Alignment(1, -1),
                  child: IconButton(
                    icon: Icon(Icons.camera),
                    color: Colors.indigoAccent,
                    onPressed: () {this._takePicture();},
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
