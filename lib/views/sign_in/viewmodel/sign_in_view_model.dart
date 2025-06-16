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
        final userCredential = await firebaseService.loginUser(email ?? '', password ?? '');
        if (context.mounted) {
          final user = userCredential.user;
          context.pushReplacementNamed(
            MyRouts.home,
              extra: {
                'email': user?.email,
                'name': null,
                'image': null,
                'isGoogle': false,
              },
          );
        }
      } on FirebaseAuthException catch (e) {
        showSnackBar(context, MyStrings.wrongEmailOrPassword);
      } catch (e) {
        showSnackBar(context, MyStrings.connectError);
      }
      EasyLoading.dismiss();
    }
  }

  Future<void> googleLogin(BuildContext context) async {
    try {
      final user = await firebaseService.loginWithGoogle();
      if (context.mounted && user != null) {
        context.pushReplacementNamed(MyRouts.home,extra: {
          'email': user.email,
          'name': user.displayName,
          'image': user.photoURL,
          'isGoogle': true,
        },);
      }
    } catch (e) {
      showSnackBar(context, MyStrings.connectError);
    }
  }
}
