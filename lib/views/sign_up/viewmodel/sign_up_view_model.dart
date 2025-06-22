part of '../sign_up_imports.dart';

class SignUpViewModel {
  final FirebaseService _firebaseService = getIt<FirebaseService>();
  String? _email;
  String? _password;
  GlobalKey<FormState> formKey = GlobalKey();

  Future<void> _signUp(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      EasyLoading.show();
      try {
        await _firebaseService.createUser(_email ?? '', _password ?? '');
        context.pushReplacementNamed(
          MyRouts.home,
          extra: UserProfileModel(email: _email ?? '', isGoogle: false),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == FirebaseKey.weakPassword) {
          showToast(MyStrings.weakPassword);
        } else if (e.code == FirebaseKey.emailExists) {
          showToast(MyStrings.accountExists);
        }
      } catch (e) {
        showToast(e.toString());
      } finally {
        EasyLoading.dismiss();
      }
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
