import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:xx_module_a_am/recorder/audio_players.dart';
import 'package:xx_module_a_am/recorder/audio_recorders.dart';

class records extends StatefulWidget {
  const records({super.key});

  @override
  State<records> createState() => _MyAppState();
}

class _MyAppState extends State<records> {
  String? audioPath;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: audioPath != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: AudioPlayer(
                    source: audioPath!,
                    onDelete: () {
                      if (!kIsWeb) {
                        try {
                          File(audioPath!).deleteSync();
                        } catch (_) {
                          // Ignored
                        }
                      }

                      setState(() => audioPath = null);
                    },
                  ),
                )
              : Recorder(
                  onStop: (path) {
                    if (kDebugMode) print('Recorded file path: $path');
                    setState(() => audioPath = path);
                  },
                ),
        ),
      ),
    );
  }
}
