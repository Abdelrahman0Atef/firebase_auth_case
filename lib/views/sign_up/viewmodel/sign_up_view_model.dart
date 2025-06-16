part of '../sign_up_imports.dart';

class SignUpViewModel {
  FirebaseService firebaseService = FirebaseService();
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();

  Future<void> signUp(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      EasyLoading.show();
      try {
        await firebaseService.createUser(email ?? '', password ?? '');
        context.pushReplacementNamed(MyRouts.home,pathParameters: {
          'email': Uri.encodeComponent(email!),
        },);
      } on FirebaseAuthException catch (e) {
        if (e.code == FirebaseKey.weakPassword) {
          showSnackBar(context, MyStrings.weakPassword);
        } else if (e.code == FirebaseKey.emailExists) {
          showSnackBar(context, MyStrings.accountExists);
        }
      } catch (e) {
        showSnackBar(context, e.toString());
      }
      EasyLoading.dismiss();
    }
  }

  Future<void> googleLogin(BuildContext context) async {
    try {
      await firebaseService.loginWithGoogle();
      if (context.mounted) {
        context.pushReplacementNamed(MyRouts.home);
      }
    } catch (e) {
      showSnackBar(context, MyStrings.connectError);
    }
  }
}
