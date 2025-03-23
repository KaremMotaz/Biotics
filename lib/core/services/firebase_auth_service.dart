import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future<User?> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user;
  }

  Future<User?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user;
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
    return (await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential))
        .user!;
  }

  Future<void> sendLinkToResetPassword({required String email}) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  Future<void> sendEmailVerification() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  Future<void> deleteAccount() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  Future<void> logOut() async {
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();
    await FirebaseAuth.instance.signOut();
  }

  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
