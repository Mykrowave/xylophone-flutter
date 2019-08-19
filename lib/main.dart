import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final List<String> _audioNotes = [
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
          child: _buildXylophoneKeyNotes(),
        ),
      ),
    );
  }

  Widget _buildXylophoneKeyNotes() {
    List<Widget> allNotes = new List<Widget>();

    _audioNotes.forEach(
      (an) => allNotes.add(
        Container(
          width: 100.0,
          color: Colors.green,
          child: XylophoneKey(
            note: an,
          ),
        ),
      ),
    );

    return Column(
      children: allNotes,
    );
  }
}

class XylophoneKey extends StatelessWidget {
  final String note;

  const XylophoneKey({Key key, @required this.note}) : super(key: key);

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
