import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final List<XylophoneKeyAsset> _audioNotes = [
    XylophoneKeyAsset(assetnote: 'note1.wav', color: Colors.red),
    XylophoneKeyAsset(assetnote: 'note2.wav', color: Colors.orange),
    XylophoneKeyAsset(assetnote: 'note3.wav', color: Colors.yellow),
    XylophoneKeyAsset(assetnote: 'note4.wav', color: Colors.green),
    XylophoneKeyAsset(assetnote: 'note5.wav', color: Colors.teal),
    XylophoneKeyAsset(assetnote: 'note6.wav', color: Colors.blue),
    XylophoneKeyAsset(assetnote: 'note7.wav', color: Colors.purple),
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
          margin: EdgeInsets.symmetric(vertical: 8.0),
          width: 100.0,
          color: an.color,
          child: XylophoneKey(
            note: an.assetnote,
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

class XylophoneKeyAsset {
  final Color color;
  final String assetnote;

  const XylophoneKeyAsset({this.assetnote, this.color});
}
