import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  Future<void> createUser(String email, String password) async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: email ?? '',
          password: password ?? '',
        );
  }

  Future<void> loginUser(String email, String password) async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: email ?? '',
          password: password ?? '',
        );
  }
}
