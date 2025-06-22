part of '../home_imports.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key, required this.user});

  final UserProfileModel user;
  final HomeViewModel vm = HomeViewModel();

  factory HomeView.fromRouteExtras(Object? extra) {
    return HomeView(user: extra as UserProfileModel);
  }

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.navy,
      body: HomeBody(vm: widget.vm, user: widget.user),
    );
  }
}
