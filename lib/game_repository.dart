import 'dart:collection';
import 'dart:math';

import 'package:flutter_records_pattern_matching/game_model.dart';

class GameRepository {
  static final List<Game> _games = [
    'The Legend of Zelda: Breath of the Wild',
    'Red Dead Redemption 2',
    'Fortnite',
    'Minecraft',
    'Grand Theft Auto V',
    'Call of Duty: Warzone',
    'Among Us',
    'Apex Legends',
    'Valorant',
    'Fall Guys: Ultimate Knockout',
    'Cyberpunk 2077',
    'Animal Crossing: New Horizons',
    'Assassins Creed Valhalla',
    'Marvels Spider-Man: Miles Morales',
    'Resident Evil Village',
    'Hitman 3',
    'Final Fantasy VII Remake',
    'Genshin Impact',
    'Ghost of Tsushima',
    'Doom Eternal',
    'NBA 2K21',
    'FIFA 21',
    'Super Smash Bros. Ultimate',
    'Hades',
    'The Last of Us Part II',
    'Ori and the Will of the Wisps',
    'Yakuza: like a Dragon',
    'Control',
    'Death Stranding',
    'Mortal Kombat 11'
  ].map((name) => Game(name: name)).toList();

  static get games => UnmodifiableListView(_games); // ???

  Future<(List<Game>, Status)> getGames() async {
    await Future.delayed(const Duration(seconds: 2));
    final n = Random().nextInt(10);

    final (List<Game>, Status) result =
        n.isEven ? (games, Status.success) : ([], Status.error);

    return Future.value(result);
  }
}

enum Status { success, error, initial, loading }
