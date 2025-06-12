import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  final _auth = FirebaseAuth.instance;

  Future<void> createUser(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
      email: email ?? '',
      password: password ?? '',
    );
  }

  Future<void> loginUser(String email, String password) async {
    await _auth.signInWithEmailAndPassword(
      email: email ?? '',
      password: password ?? '',
    );
  }

  Future<UserCredential> loginWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;
    final userCredential = GoogleAuthProvider.credential(
      idToken: googleAuth?.idToken,
      accessToken: googleAuth?.accessToken,
    );

    return await _auth.signInWithCredential(userCredential);
  }
}
