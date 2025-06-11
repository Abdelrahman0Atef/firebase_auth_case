part of '../sign_in_imports.dart';

class SignInViewModel {
  FirebaseService firebaseService = FirebaseService();
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();

  Future<void> login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      EasyLoading.show();

      try {
        await firebaseService.loginUser(email ?? '', password ?? '');
        if (context.mounted) {
          context.pushReplacementNamed(MyRouts.home);
        }
      } on FirebaseAuthException catch (e) {
          showSnackBar(context, MyStrings.wrongEmailOrPassword);
      } catch (e) {
        showSnackBar(context, MyStrings.connectError);
      }
      EasyLoading.dismiss();
    }
  }
}
