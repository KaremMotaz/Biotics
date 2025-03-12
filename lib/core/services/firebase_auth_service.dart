import 'package:biocode/core/errors/exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future<User?> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(
            message: 'Your password is too weak. Try a stronger one.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'An account already exists for this email.');
      } else if (e.code == 'invalid-email') {
        throw CustomException(
            message:
                'The email address is not valid. Please enter a correct email.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message:
                'No internet connection. Please check your network and try again.');
      } else {
        throw CustomException(message: 'Failed to sign up: ${e.message}');
      }
    } catch (e) {
      throw CustomException(
          message: 'An unexpected error occurred. Please try again later.');
    }
  }

  Future<User?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'No account found for this email.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'Incorrect password. Please try again.');
      } else if (e.code == "invalid-credential") {
        throw CustomException(message: "Invalid email or password.");
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'No internet connection.');
      } else {
        throw CustomException(message: 'Authentication failed: ${e.message}');
      }
    } catch (e) {
      throw CustomException(
          message: "An unexpected error occurred. Please try again later.");
    }
  }

  Future<User> signinWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signinWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)).user!;
  }
    bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
