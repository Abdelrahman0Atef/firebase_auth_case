part of '../sign_in_imports.dart';

class SignInViewModel extends ChangeNotifier {
  final FirebaseService _firebaseService = getIt<FirebaseService>();
  String? _email;
  String? _password;
  final GlobalKey<FormState> _formKey = GlobalKey();

  // Getters
  String? get email => _email;
  String? get password => _password;
  GlobalKey<FormState> get formKey => _formKey;

  // التحقق من حالة الدفع
  bool get isAppPaid => isClientPaid;

  // رسالة عدم الدفع
  String get paymentMessage => "عذراً، التطبيق غير مدفوع الرسوم.\nيرجى التواصل مع المالك لتفعيل التطبيق.";

  // Setters
  void setEmail(String? email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String? password) {
    _password = password;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    // التحقق من حالة الدفع أولاً
    if (!isAppPaid) {
      showToast("التطبيق غير مفعل - يرجى التواصل مع المالك");
      return;
    }

    if (_formKey.currentState!.validate()) {
      EasyLoading.show();

      try {
        // هنا يمكنك إضافة منطق تسجيل الدخول الفعلي
        await _firebaseService.loginUser(_email!, _password!);

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

  Future<void> googleLogin(BuildContext context) async {
    // التحقق من حالة الدفع أولاً
    if (!isAppPaid) {
      showToast("التطبيق غير مفعل - يرجى التواصل مع المالك");
      return;
    }

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