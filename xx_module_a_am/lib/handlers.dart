import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'models.dart';
class ProviderClass extends ChangeNotifier {
    List _events = [];
    List _tickets = [];
    List get events => _events;

    List get tickets => _tickets;
    Future<void> getEvents() async {
      final List list;
      list = await FileManager().readJsonFile("events_data", "events");
      _events = list.map((e) => Event.fromJson(e)).toList();
      notifyListeners();
    }

    Future<void> getTickets() async {
      final List list;
      list = await FileManager().readJsonFile("tickets_data", "tickets");
      _events = list.map((e) => Ticket.fromJson(e)).toList();
      notifyListeners();
  }

    Future<void>removeTickets(Ticket ticket) async {
      final index = _tickets.indexWhere((t) => t.id == ticket.id);
      _tickets.remove(_tickets[index]);
      notifyListeners();
    }

  Future<void> addViewCount(Event event) async {
    final index = _events.indexWhere((e) => e.id == event.id);
    _events[index] = _events[index].copyWith(viewCount: _events[index].viewCount + 1,);
    await FileManager().writeJsonFile(_events,"events_data", "events");
    notifyListeners();
  }
  
}

class FileManager {
  FileManager._internal();

  static final FileManager _instance = FileManager._internal();

  factory FileManager() =>
      _instance; // u call it as FileManager().<method here>

  Future<String> get _directoryPath async {
    Directory directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _file async {
    final path = await _directoryPath;
    return File('$path/cheetah.txt');
  }

  Future<File> get_jsonFile(String fileName) async {
    final path = await _directoryPath;
    print("path found!!!");
    return File('$path/$fileName.json');
  }

  Future<List<dynamic>> readJsonFile(String fileName, String category) async {
    File file = await get_jsonFile(fileName);

    if (!await file.exists()) {
      try {
        final assetContent = await rootBundle.loadString(
          'data/$fileName.json',
        );
        print("Loaded!!!!!!!");
        await file.writeAsString(assetContent);
      } catch (e) {
        print("Asset load failed: $e");
      }
    }

    //String content = await rootBundle.loadString('assets/$fileName.json');

    try {
      String content = await file.readAsString();

      if (content.isEmpty) return [];
      final returnVal = json.decode(content);
      return returnVal[category];
    } catch (e) {
      print(e);
      return []; // fallback if corrupted
    }
  }

  Future<void> writeJsonFile(
    List givenList,
    String dest,
    String category,
  ) async {
    File file = await get_jsonFile(dest);
    await file.writeAsString(
      json.encode({category: givenList.map((h) => h.toJson()).toList()}),
    );
    //return Tasks;
  }

  Future<File> get _imageFile async {
    final path = await _directoryPath;
    return File('$path/cheetah_image');
  }

  Future<String> readTextFile() async {
    String fileContent = 'blaaaank';

    File file = await _file;

    if (await file.exists()) {
      try {
        fileContent = await file.readAsString();
      } catch (e) {
        print(e);
      }
    }

    return fileContent;
  }

  Future<String> writeTextFile() async {
    String text = DateFormat('h:mm:ss').format(DateTime.now());

    File file = await _file;
    await file.writeAsString(text);
    return text;
  }

  Future<Uint8List> writeImageFile() async {
    Response response = await Client().get(
      Uri.parse(
        'https://i.pinimg.com/originals/f5/1d/08/f51d08be05919290355ac004cdd5c2d6.png',
      ),
    );

    Uint8List bytes = response.bodyBytes;
    File file = await _imageFile;
    await file.writeAsBytes(bytes);

    print(file.path);
    print(bytes);

    return bytes;
  }

  Future<Uint8List?> readImageFile() async {
    File file = await _imageFile;
    Uint8List byteList;

    if (await file.exists()) {
      try {
        byteList = await file.readAsBytes();
        return byteList;
      } catch (e) {
        print(e);
      }
    }

    return null;
  }

  deleteImage() async {
    File file = await _imageFile;
    if (await file.exists()) {
      await file.delete();
    }
  }
}
