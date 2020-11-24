import 'package:flutter/material.dart';
import 'package:great_places/models/place.dart';
import 'package:great_places/providers/great_places.provider.dart';
import 'package:great_places/screens/add_place.screen.dart';
import 'package:great_places/widgets/great_places_list_item.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  Widget buildGreatPlacesList(BuildContext context, List<Place> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (ctx, index) => GreatPlacesListItem(item: items[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          )
        ],
      ),
      body: Center(
        child: Consumer<GreatPlaces>(
          builder: (context, greatPlacesProvider, child) {
            return greatPlacesProvider.items.length == 0
                ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 200),
                    const Text(
                      'There are no places yet!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Try adding some.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
                : this.buildGreatPlacesList(context, greatPlacesProvider.items);
          },
        ),
      ),
    );
  }
}
