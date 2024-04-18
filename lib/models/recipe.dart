import 'package:gastro_galaxy/models/ingredient.dart';

class Recipe {
  final int? id;
  final String name;
  final String description;
  final String imageUrl;
  final int? cId;
  List<Ingredient>? ingredients;

  Recipe({
    this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    this.cId,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      name: json['name'],
      cId: json['cid'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'cId': cId,
      'description': description,
      'imageUrl': imageUrl,
    };
  }
}
