import 'package:flutter/material.dart';
import 'package:meu_rango/widgets/main_drawer.dart';

class FiltersPage extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> filters;
  const FiltersPage({@required this.saveFilters, this.filters});

  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  bool _glutenFree;
  bool _vegetarian;
  bool _vegan;
  bool _lactoseFree;


  @override
  void initState() {
    super.initState();
    this._glutenFree = widget.filters['gluten'];
    this._lactoseFree = widget.filters['lactose'];
    this._vegetarian = widget.filters['vegetarian'];
    this._vegan = widget.filters['vegan'];
  }

  Widget _buildSwitchTile(
      String title, String subtitle, bool value, void valueChanged(bool)) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        valueChanged(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtros'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => {
              widget.saveFilters({
                'gluten': this._glutenFree,
                'lactose': this._lactoseFree,
                'vegetarian': this._vegetarian,
                'vegan': this._vegan
              })
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Ajust suas preferências',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                this._buildSwitchTile(
                  'Sem Glúten',
                  'Incluir somente refeições sem glúten',
                  this._glutenFree,
                  (value) {
                    setState(() {
                      this._glutenFree = value;
                    });
                  },
                ),
                this._buildSwitchTile(
                  'Vegetariana',
                  'Incluir somente refeições sem vegetariana',
                  this._vegetarian,
                  (value) {
                    setState(() {
                      this._vegetarian = value;
                    });
                  },
                ),
                this._buildSwitchTile(
                  'Vegana',
                  'Incluir somente refeições veganas',
                  this._vegan,
                  (value) {
                    setState(() {
                      this._vegan = value;
                    });
                  },
                ),
                this._buildSwitchTile(
                  'Sem Lactose',
                  'Incluir somente refeições sem lactos',
                  this._lactoseFree,
                  (value) {
                    setState(() {
                      this._lactoseFree = value;
                    });
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
