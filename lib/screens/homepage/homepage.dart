import 'package:dex/constants.dart';
import 'package:dex/models/region.dart';
import 'package:dex/screens/pokedex/show_pokedex.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokemon Dex"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(defaultPadding),
        children: const [
          RegionTile(name: RegionName.kanto),
          SizedBox(height: defaultPadding),
          RegionTile(name: RegionName.johto),
          SizedBox(height: defaultPadding),
          RegionTile(name: RegionName.hoenn),
          SizedBox(height: defaultPadding),
          RegionTile(name: RegionName.sinnoh),
          SizedBox(height: defaultPadding),
          RegionTile(name: RegionName.unova),
          SizedBox(height: defaultPadding),
          RegionTile(name: RegionName.kalos),
          SizedBox(height: defaultPadding),
          RegionTile(name: RegionName.alola),
          SizedBox(height: defaultPadding),
          RegionTile(name: RegionName.galar)
        ],
      ),
    );
  }
}

class RegionTile extends StatelessWidget {
  final RegionName name;
  const RegionTile({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return ShowPokedex(
                  name: name,
                );
              }),
            );
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(defaultPadding * 2),
            child: Text(
              regions[name]!.name,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 21,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
