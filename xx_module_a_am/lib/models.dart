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

