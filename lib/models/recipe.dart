class Recipe {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  late final int cId;

  Recipe({required this.id, required this.name, required this.description, required this.imageUrl, cId});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      name: json['name'],
      cId: json['cid'],
      description: json['description'],
      imageUrl: json['imageUrl']
   );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'cId': cId,
      'description': description,
      'imageUrl': imageUrl
    };
  }
}