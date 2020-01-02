class Source {
  String id;
  String name;

  Source({
    this.id,
    this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json['id'] == null ? null : json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id == null ? null : id,
        'name': name,
      };
}
