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
  List<String> audioPaths = [
    "assets/audio/01.mp3",
    "assets/audio/02.mp3",
    "assets/audio/03.mp3"
  ];
  initAudioPlayer1() {
    player1 = new AssetsAudioPlayer();
    player1.finished.listen((finsihed) {
      myPrint("EVENT - Player1 Finished");
    });

    player1.current.listen((playingAudio) {
      // final asset = playingAudio.assetAudio;
      // final songDuration = playingAudio.duration;
      myPrint("EVENT - Player1 Current");
    });

    player1.isLooping.listen((loop) {
      myPrint("EVENT - Player1 Looping");
    });
    player1.playlistAudioFinished.listen((event) {
      myPrint("EVENT - Player1 PlaylistFinished");
    });
  }

  initAudioPlayer2() {
    player2 = new AssetsAudioPlayer();
    player2.finished.listen((finsihed) {
      myPrint("EVENT - player2 Finished");
    });

    player2.current.listen((playingAudio) {
      // final asset = playingAudio.assetAudio;
      // final songDuration = playingAudio.duration;
      myPrint("EVENT - player2 Current");
    });

    player2.isLooping.listen((loop) {
      myPrint("EVENT - player2 Looping");
    });
    player2.playlistAudioFinished.listen((event) {
      myPrint("EVENT - player2 PlaylistFinished");
    });
  }

  initState() {
    initAudioPlayer2();
    initAudioPlayer1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
    player1.playlistPrevious();
  }

  _first_next() {
    myPrint("First => SKIP NEXT");
    player1.playlistNext();
  }

  _first_play() {
    myPrint("First => Play");
    player1.openPlaylist(Playlist(assetAudioPaths: audioPaths.reversed.toList()));
    // player1.open(audioPaths[0]);
  }

  _first_pause() {
    myPrint("First => Pause");
    player1.pause();
  }

  _first_stop() {
    myPrint("First => Stop");
    player1.stop();
  }

  _second_previous() {
    myPrint("Second => SKIP Previous");
    player2.playlistPrevious();
  }

  _second_next() {
    myPrint("Second => SKIP NEXT");
    player2.playlistNext();
  }

  _second_play() {
    myPrint("Second => Play");
    player2.openPlaylist(Playlist(assetAudioPaths: audioPaths));
  }

  _second_pause() {
    myPrint("Second => Pause");
    player2.pause();
  }

  _second_stop() {
    myPrint("Second => Stop");
    player2.stop();
  }
}
