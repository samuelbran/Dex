import 'package:cached_network_image/cached_network_image.dart';
import 'package:dex/widgets/spinner.dart';
import 'package:dex/constants.dart';
import 'package:dex/helpers/capitalize.dart';
import 'package:dex/models/pokedex.dart';
import 'package:dex/models/region.dart';
import 'package:dex/screens/pokemon/show_pokemon.dart';
import 'package:dex/services/fetch_pokedex.dart';
import 'package:flutter/material.dart';

class ShowPokedex extends StatefulWidget {
  final RegionName name;
  const ShowPokedex({super.key, required this.name});

  @override
  State<ShowPokedex> createState() => _ShowPokedexState();
}

class _ShowPokedexState extends State<ShowPokedex> {
  late Future<Pokedex> pokedex;

  @override
  void initState() {
    super.initState();
    pokedex = fetchPokedex(regions[widget.name]!.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(regions[widget.name]!.name)),
      body: FutureBuilder<Pokedex>(
        future: pokedex,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.pokemonEntries.length,
              itemBuilder: (BuildContext context, int index) {
                PokedexEntry item = snapshot.data!.pokemonEntries[index];
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return ShowPokemon(
                            title: item.name,
                            number: item.number,
                          );
                        }),
                      );
                    },
                    child: Card(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(defaultPadding * 2),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: Hero(
                                tag: item.number,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "$officialArtworkURL/${item.number}.png",
                                  placeholder: (context, url) => Image.asset(
                                    "lib/assets/images/placeholder.png",
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: defaultPadding * 2,
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                capitalize(item.name),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 21,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const Spinner();
        },
      ),
    );
  }
}
