import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../errors/failures.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        throw CustomException(message: 'تم إلغاء العملية');
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCred = await _auth.signInWithCredential(credential);
      return userCred.user!;
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException signInWithGoogle: ${e.code} ${e.message}');
      throw CustomException(message: 'فشل تسجيل الدخول عبر جوجل');
    } catch (e) {
      log('Exception signInWithGoogle: $e');
      throw CustomException(message: 'حدث خطأ غير متوقع');
    }
  }
}
