import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playAudio(int n1) async {
    try {
      await _audioPlayer
          .stop(); // Ensure the player is stopped before setting a new source
      await _audioPlayer.setSource(AssetSource('note$n1.wav'));
      await _audioPlayer.resume();
    } catch (e) {
      debugPrint("Error playing audio: $e");
    }
  }
  Expanded change(Color color,int number){
    return Expanded(
      child: TextButton(
        onPressed: () {
          _playAudio(number);
        },
        style:TextButton.styleFrom(
          padding: const EdgeInsets.all(0.0),
        ),
        child: Container(
          color:color,
          width: double.infinity
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(children: [
          change(Colors.red,1),
          change(Colors.orange,2),
          change(Colors.yellow,3),
          change(Colors.green,4),
          change(Colors.teal,5),
          change(Colors.blue,6),
          change(Colors.purple,7),
        ]
        ),
      ),
    ));
  }
}
