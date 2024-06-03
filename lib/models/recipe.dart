import 'package:gastro_galaxy/models/ingredient.dart';

class Recipe {
  final int? id;
  final String? name;
  final String? description;
  final String? longDescription;
  final String? url;
  final int? categoryId;
  List<Ingredient>? ingredients;

  Recipe({
    this.id,
    required this.name,
    required this.description,
    required this.longDescription,
    required this.url,
    this.categoryId,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['Id'],
      name: json['Name'],
      categoryId: json['CategoryId'],
      description: json['Description'],
      longDescription: json['LongDescription'],
      url: json['Url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'categoryId': categoryId,
      'description': description,
      'longDescription': longDescription,
      'imageUrl': url,
    };
  }
}
