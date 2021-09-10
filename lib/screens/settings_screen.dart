import 'package:flutter/material.dart';
import 'package:receitasapp/components/main_drawer.dart';
import 'package:receitasapp/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;

  const SettingsScreen(this.onSettingsChanged, this.settings);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings? settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: (value) {
          onChanged(value);
          widget.onSettingsChanged(settings!);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Filtros',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'Sem Glúten',
                  'Só Exibe refeições sem glúten',
                  settings!.isGlutenFree,
                  (value) => setState(
                    () => settings!.isGlutenFree = value,
                  ),
                ),
                _createSwitch(
                  'Sem Lactose',
                  'Só Exibe refeições sem lactose',
                  settings!.isLactoseFree,
                  (value) => setState(
                    () => settings!.isLactoseFree = value,
                  ),
                ),
                _createSwitch(
                  'Comente Comidas Veganas',
                  'Só Exibe refeições veganas',
                  settings!.isVegan,
                  (value) => setState(
                    () => settings!.isVegan = value,
                  ),
                ),
                _createSwitch(
                  'Somente Comidas Vegetarianas',
                  'Só Exibe refeições vegetarianas',
                  settings!.isVegetarian,
                  (value) => setState(
                    () => settings!.isVegetarian = value,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
