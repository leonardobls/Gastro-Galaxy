class Profile {
  int? id;
  String? image;
  String? name;
  String? email;
  String? phone;
  String? password;

  Profile({
    this.id,
    this.image,
    this.name,
    this.email,
    this.phone,
    this.password,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['Id'],
      image: json['image'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'email': email,
      'phone': phone,
    };
  }
}
