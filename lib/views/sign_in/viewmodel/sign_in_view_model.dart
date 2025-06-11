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
        if (e.code == FirebaseKey.userNotFound) {
          showSnackBar(context, MyStrings.inValidEmail);
        } else if (e.code == FirebaseKey.wrongPassword) {
          showSnackBar(context, MyStrings.wrongPassword);
        }else{
          showSnackBar(context, MyStrings.notUser);
        }
      } catch (e) {
        showSnackBar(context, e.toString());
      }
      EasyLoading.dismiss();
    }
  }
}
