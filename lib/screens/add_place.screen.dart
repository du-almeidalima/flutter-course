import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.provider.dart';
import 'package:great_places/widgets/image_input.dart';
import 'package:great_places/widgets/location_input.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  static const String routeName = '/add-place';

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  TextEditingController _titleController = TextEditingController();
  File _pickedImage;

  void _selectImageHandler(File pickedImage) {
    this._pickedImage = pickedImage;
  }

  void _saveHandler() {
    if (this._titleController.text.isEmpty || this._pickedImage == null) {
      return;
    }

    Provider.of<GreatPlaces>(context, listen: false).add(
      this._titleController.text,
      _pickedImage,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a New Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // This will take all available space it can in a view, but not
          // overlapping the boundaries
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: _titleController,
                    ),
                    SizedBox(height: 10),
                    ImageInput(onSelectImage: this._selectImageHandler),
                    SizedBox(height: 10),
                    LocationInput(),
                  ],
                ),
              ),
            ),
          ),
          RaisedButton.icon(
            icon: const Icon(Icons.add),
            label: const Text('Add Place'),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).accentColor,
            elevation: 0,
            onPressed: this._saveHandler,
          )
        ],
      ),
    );
  }
}
