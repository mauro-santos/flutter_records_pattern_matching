import 'package:flutter/material.dart';
import 'package:flutter_records_pattern_matching/game_listview.dart';
import 'package:flutter_records_pattern_matching/game_model.dart';
import 'package:flutter_records_pattern_matching/game_repository.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  (List<Game>, Status) gameRecord = ([], Status.initial);

  @override
  void initState() {
    super.initState();
    Future(() => loadGames());
  }

  loadGames() async {
    setState(() => gameRecord = (gameRecord.$1, Status.loading));
    final record = await GameRepository().getGames();
    setState(() => gameRecord = record);
  }

  @override
  Widget build(BuildContext context) {
    final (games, status) = gameRecord;

    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 2), () => 'Games'),
          builder: (context, snapshot) => switch (snapshot) {
            AsyncSnapshot(hasData: true, data: final String data) => Text(data),
            AsyncSnapshot(hasError: true) => const Text('Error!'),
            AsyncSnapshot() => const CircularProgressIndicator(),
          },
        ),
      ),
      body: switch (status) {
        Status.initial => const Center(child: Text('Nenhum game')),
        Status.loading => const Center(child: CircularProgressIndicator()),
        Status.success => GameListview(games: games),
        Status.error => const Center(child: Text('Erro ao carregar!'))
      },
      floatingActionButton: FloatingActionButton(
        onPressed: loadGames,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
