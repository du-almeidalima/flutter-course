import 'package:flutter/material.dart';
import 'package:great_places/models/place.dart';

class GreatPlacesListItem extends StatelessWidget {
  final Place item;

  const GreatPlacesListItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: FileImage(this.item.image),
      ),
      title: Text(this.item.title),
      onTap: (){},
    );
  }
}
