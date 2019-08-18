import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  final List<String> _AudioNotes = [
    'note1.wav',
    'note2.wav',
    'note3.wav',
    'note4.wav',
    'note5.wav',
    'note6.wav',
    'note7.wav',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: Column(
          children: <Widget>[
            XylophoneKey(
              note: 'note1.wav',
            )
          ],
        )),
      ),
    );
  }
}

class XylophoneKey extends StatelessWidget {
  final String note;

  XylophoneKey({Key key, @required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        child: Text('PlayMe!'),
        onPressed: () {
          final AudioCache player = AudioCache();
          player.play(this.note);
        },
      ),
    );
  }
}
