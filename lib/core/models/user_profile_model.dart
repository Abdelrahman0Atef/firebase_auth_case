class UserProfileModel {
  final String email;
  final String? name;
  final String? image;
  final bool isGoogle;

  const UserProfileModel({
    required this.email,
    this.name,
    this.image,
    required this.isGoogle,
  });

  factory UserProfileModel.fromMap(Map<String, dynamic> map) {
    return UserProfileModel(
      email: map['email'],
      name: map['name'],
      image: map['image'],
      isGoogle: map['isGoogle'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {'email': email, 'name': name, 'image': image, 'isGoogle': isGoogle};
  }
}
