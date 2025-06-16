part of '../home_imports.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
    required this.email,
    this.name,
    this.image,
    required this.isGoogle,
  });

  final String email;
  final String? name;
  final String? image;
  final bool isGoogle;

  factory HomeView.fromRouteExtras(Map<String, dynamic> extras) {
    return HomeView(
      email: extras['email'],
      name: extras['name'],
      image: extras['image'],
      isGoogle: extras['isGoogle'] ?? false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.navy,
      body: HomeBody(
        isGoogle: isGoogle,
        image: image,
        name: name,
        email: email,
      ),
    );
  }
}
