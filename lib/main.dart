import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

main() {
  runApp(AssetAudioPlayerMultiplayerProblem());
}

myPrint(dynamic message) {
  debugPrint("\x1b[31m\x1b[1m$message\x1b[0m");
}

class AssetAudioPlayerMultiplayerProblem extends StatefulWidget {
  @override
  AssetAudioPlayerMultiplayerProblemState createState() =>
      AssetAudioPlayerMultiplayerProblemState();
}

class AssetAudioPlayerMultiplayerProblemState
    extends State<AssetAudioPlayerMultiplayerProblem> {
  AssetsAudioPlayer player1, player2;
  double _iconSize = 40;
  initAudioPlayer1() {
    player1 = new AssetsAudioPlayer();
    player1.finished.listen((finsihed) {
      print("EVENT - Finished Throw");
    });
  }

  _firstPlayer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("First Media Player Control"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.skip_previous),
              onPressed: () {
                _first_previous();
              },
              iconSize: _iconSize,
            ),
            IconButton(
              icon: Icon(Icons.pause),
              onPressed: () {
                _first_pause();
              },
              iconSize: _iconSize,
            ),
            IconButton(
              icon: Icon(Icons.play_arrow),
              onPressed: () {
                _first_play();
              },
              iconSize: _iconSize + 20,
            ),
            IconButton(
              icon: Icon(Icons.stop),
              onPressed: () {
                _first_stop();
              },
              iconSize: _iconSize,
            ),
            IconButton(
              icon: Icon(Icons.skip_next),
              onPressed: () {
                _first_next();
              },
              iconSize: 60,
            ),
          ],
        ),
      ],
    );
  }

  _secondPlayer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Second Media Player Control"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.skip_previous),
              onPressed: () {
                _second_previous();
              },
              iconSize: _iconSize,
            ),
            IconButton(
              icon: Icon(Icons.pause),
              onPressed: () {
                _second_pause();
              },
              iconSize: _iconSize,
            ),
            IconButton(
              icon: Icon(Icons.play_arrow),
              onPressed: () {
                _second_play();
              },
              iconSize: _iconSize + 20,
            ),
            IconButton(
              icon: Icon(Icons.stop),
              onPressed: () {
                _second_stop();
              },
              iconSize: _iconSize,
            ),
            IconButton(
              icon: Icon(Icons.skip_next),
              onPressed: () {
                _second_next();
              },
              iconSize: 60,
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "HI",
      theme: new ThemeData(primaryColor: Colors.teal),
      home: Scaffold(
        appBar: AppBar(
          title: Title(
            color: Colors.blue,
            child: Text("Assets Audio Player Problem"),
          ),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[_firstPlayer(), _secondPlayer()],
          ),
        ),
      ),
    );
  }

  _first_previous() {
    myPrint("First => SKIP Previous");
  }

  _first_next() {
    myPrint("First => SKIP NEXT");
  }

  _first_play() {
    myPrint("First => Play");
  }

  _first_pause() {
    myPrint("First => Pause");
  }

  _first_stop() {
    myPrint("First => Stop");
  }

  _second_previous() {
    myPrint("Second => SKIP Previous");
  }

  _second_next() {
    myPrint("Second => SKIP NEXT");
  }

  _second_play() {
    myPrint("Second => Play");
  }

  _second_pause() {
    myPrint("Second => Pause");
  }

  _second_stop() {
    myPrint("Second => Stop");
  }
}
