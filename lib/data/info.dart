class Info {
  final int? id;
  final String? name;

  Info({this.id, this.name});

  factory Info.fromJson(Map<dynamic, dynamic> json) {
    return Info(id: json['id'], name: json['name']);
  }
}
