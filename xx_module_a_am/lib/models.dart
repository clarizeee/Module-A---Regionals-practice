// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Event {
  final int id;
  final String title;
  final String text;
  final List images;
  int viewCount;

  Event({required this.id, required this.title, required this.text, required this.images, required this.viewCount,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json["id"],
      title: json["title"] ?? "",
      text: json["text"] ?? "",
      images: json["images"] ?? "",
      viewCount: json["viewCount"] ?? 0
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "title": title, "text": text, "images" : images, "viewCount": viewCount};
  }

  Event copyWith({int? id, String? title, String? text, List? images, int? viewCount}) {
    return Event(
      id: id ?? this.id,
      title: title ?? this.title,
      text: text ?? this.text,
      images: images ?? this.images,
      viewCount: viewCount ?? this.viewCount
    );
  }

}

class Ticket {
  final int id;
   String type;
   String name;
   String time;
   String seat;
   String image;

  Ticket({required this.id, required this.type, required this.name, required this.time,
   required this.seat, required this.image});


  Ticket copyWith({int? id, String? type, String? name, String? time, String? seat, String? image}) {
    return Ticket(
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      time: time ?? this.time,
      seat: seat ?? this.seat,
      image: image ?? this.image,
    );
  }
  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      id: json["id"],
      type: json["type"] ?? "",
      name: json["name"] ?? "",
      time: json["time"] ?? "",
      seat: json["seat"] ?? "",
      image: json["image"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id, 
      "type": type,
      "name": name,
      "time": time,
      "seat": seat,
      "image": image,
      };
  }

  /// Alternative JSON with overrides
}

class Recording {
  int id;
  String name;
  String path;
  Recording({
    required this.id,
    required this.name,
    required this.path,
  });

  Recording copyWith({
    int? id,
    String? name,
    String? path,
  }) {
    return Recording(
      id: id ?? this.id,
      name: name ?? this.name,
      path: path ?? this.path,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'path': path,
    };
  }

  factory Recording.fromMap(Map<String, dynamic> map) {
    return Recording(
      id: map['id'] as int,
      name: map['name'] as String,
      path: map['path'] as String,
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory Recording.fromJson(String source) => Recording.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Recording(id: $id, name: $name, path: $path)';

  @override
  bool operator ==(covariant Recording other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.path == path;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ path.hashCode;
}
