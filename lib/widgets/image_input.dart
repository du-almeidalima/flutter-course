import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as sysPaths;

class ImageInput extends StatefulWidget {
  final Function(File pickedImage) onSelectImage;

  const ImageInput({this.onSelectImage});

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  void _takePicture() async {
    final picker = ImagePicker();
    final pickerImageFile = await picker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    if (pickerImageFile == null) {
      return;
    }

    final imageFile = File(pickerImageFile.path);
    setState(() {
      this._storedImage = imageFile;
    });

    // To save a File in the device HD, we need to follow the OSs rules. Both
    // Android and IOs specify locations/paths in were a File can be saved.
    // For that the package path_provide is useful

    final appDir = await sysPaths.getApplicationDocumentsDirectory();
    // Get the fileName
    final fileName = path.basename(imageFile.path);
    final savedImage = await this._storedImage.copy('${appDir.path}/$fileName');

    // Call parent handler
    widget.onSelectImage(savedImage);
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
            height: 350,
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
                    icon: Icon(Icons.camera_alt),
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
