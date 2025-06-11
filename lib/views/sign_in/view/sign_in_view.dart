part of '../sign_in_imports.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  SignInViewModel vm = SignInViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: MyColors.white, body: SignInBody(vm: vm));
  }
}
