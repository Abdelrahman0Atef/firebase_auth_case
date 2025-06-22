part of '../sign_in_imports.dart';

class SignInViewModel {
  final FirebaseService _firebaseService = getIt<FirebaseService>();
  String? _email;
  String? _password;
  final GlobalKey<FormState> _formKey = GlobalKey();

  Future<void> _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      EasyLoading.show();

      try {
        if (context.mounted) {
          context.pushReplacementNamed(
            MyRouts.home,
            extra: UserProfileModel(email: _email ?? '', isGoogle: false),
          );
        }
      } on FirebaseAuthException catch (e) {
        showToast(MyStrings.wrongEmailOrPassword);
      } catch (e) {
        showToast(MyStrings.connectError);
      }
      EasyLoading.dismiss();
    }
  }

  Future<void> _googleLogin(BuildContext context) async {
    try {
      final user = await _firebaseService.loginWithGoogle();
      if (context.mounted && user != null) {
        context.pushReplacementNamed(
          MyRouts.home,
          extra: UserProfileModel(
            email: user.email ?? '',
            name: user.displayName,
            image: user.photoURL,
            isGoogle: true,
          ),
        );
      }
    } catch (e) {
      showToast(MyStrings.connectError);
    }
  }
}
