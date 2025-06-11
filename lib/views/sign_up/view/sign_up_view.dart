part of '../sign_up_imports.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  SignUpViewModel vm = SignUpViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: MyColors.white, body: SignUpBody(vm: vm));
  }
}
