import 'package:flutter/material.dart';
import 'package:flutter_records_pattern_matching/game_model.dart';

class GameListview extends StatelessWidget {
  final List<Game> games;
  const GameListview({super.key, this.games = const []});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, i) => ListTile(
        title: Text(games[i].name),
        onTap: () => {},
      ),
      separatorBuilder: (_, __) => const Divider(),
      itemCount: games.length,
    );
  }
}
