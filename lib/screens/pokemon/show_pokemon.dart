import 'package:cached_network_image/cached_network_image.dart';
import 'package:dex/widgets/spinner.dart';
import 'package:dex/constants.dart';
import 'package:dex/helpers/capitalize.dart';
import 'package:dex/models/pokemon.dart';
import 'package:dex/models/type.dart';
import 'package:dex/services/fetch_pokemon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShowPokemon extends StatefulWidget {
  const ShowPokemon({super.key, required this.title, required this.number});

  final String title;
  final int number;

  @override
  State<ShowPokemon> createState() => _ShowPokemonState();
}

class _ShowPokemonState extends State<ShowPokemon> {
  late Future<Pokemon> futurePokemon;

  @override
  void initState() {
    super.initState();
    futurePokemon = fetchPokemon(widget.number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(capitalize(widget.title)),
      ),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: Hero(
              tag: widget.number,
              child: CachedNetworkImage(
                imageUrl: "$officialArtworkURL/${widget.number}.png",
                placeholder: (context, url) => Image.asset(
                  "lib/assets/images/placeholder.png",
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(defaultPadding * 2),
            color: Colors.white,
            child: FutureBuilder<Pokemon>(
              future: futurePokemon,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "#${snapshot.data!.id.toString()} ${capitalize(snapshot.data!.name)}",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Row(
                        children: [
                          Text("Weight: ${snapshot.data!.weight.toString()}kg"),
                          const SizedBox(width: 20.0),
                          Text("Height: ${snapshot.data!.height.toString()}m"),
                        ],
                      ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      PokemonTypeBox(type: snapshot.data!.types[0])
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const Spinner();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PokemonTypeBox extends StatelessWidget {
  const PokemonTypeBox({
    Key? key,
    required this.type,
  }) : super(key: key);

  final Type type;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Container(
        decoration: BoxDecoration(
          color: type.color,
          borderRadius: const BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            type.svgPath,
            width: 25,
            height: 25,
          ),
        ),
      ),
    );
  }
}
