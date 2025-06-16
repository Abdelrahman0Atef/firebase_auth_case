part of '../home_imports.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.isGoogle,
    required this.image,
    required this.name,
    required this.email,
  });

  final bool isGoogle;
  final String? image;
  final String? name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          isGoogle
              ? ListTile(
                leading:
                    image != null
                        ? CircleAvatar(backgroundImage: NetworkImage(image!))
                        : const CircularProgressIndicator(),
                title: CustomText(text: name ?? 'No Name'),
                subtitle: CustomText(
                  text: email,
                  fontWeight: FontWeight.normal,
                ),
              )
              : CustomText(text: "Welcome, $email", fontSize: 16.sp),
    );
  }
}
