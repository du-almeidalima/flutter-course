import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AuthProfileImagePicker extends StatefulWidget {
  AuthProfileImagePicker({Key key}) : super(key: key);

  @override
  AuthProfileImagePickerState createState() => AuthProfileImagePickerState();
}

class AuthProfileImagePickerState extends State<AuthProfileImagePicker> {
  final imagePicker = ImagePicker();
  File _imageFile;

  File get imageFile {
    return this._imageFile;
  }

  Future<void> _pickImage() async {
    final pickedFile = await this.imagePicker.getImage(
          source: ImageSource.camera,
          imageQuality: 50,
          maxWidth: 150,
        );

    setState(() {
      this._imageFile = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 100,
            backgroundColor: Theme.of(context).primaryColor,
            backgroundImage:
                this._imageFile != null ? FileImage(this._imageFile) : null,
          ),
          FlatButton.icon(
            textColor: Theme.of(context).primaryColorDark,
            icon: Icon(Icons.image),
            label: Text('Add an image to yourself!'),
            onPressed: this._pickImage,
          )
        ],
      ),
    );
  }
}
