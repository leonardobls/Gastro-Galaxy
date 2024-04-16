class Recipe {
  final int id;
  final String name;
  late final int cId;

  Recipe({required this.id, required this.name, cId});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      name: json['name'],
      cId: json['cid']
   );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}