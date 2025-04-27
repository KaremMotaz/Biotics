import '../../generated/l10n.dart';
import 'failure.dart';

class AuthFailure extends Failure {
  AuthFailure(super.errMessage);

  factory AuthFailure.fromCode(String code, S locale) {
    switch (code) {
      case "invalid-email":
        return AuthFailure(locale.invalidEmail);
      case "user-not-found":
        return AuthFailure(locale.userNotFound);
      case "wrong-password":
        return AuthFailure(locale.wrongPassword);
      case "email-already-in-use":
        return AuthFailure(locale.emailAlreadyInUse);
      case "weak-password":
        return AuthFailure(locale.weakPassword);
      case "user-disabled":
        return AuthFailure(locale.userDisabled);
      case "too-many-requests":
        return AuthFailure(locale.tooManyRequests);
      case "operation-not-allowed":
        return AuthFailure(locale.operationNotAllowed);
      case "network-request-failed":
        return AuthFailure(locale.networkRequestFailed);
      case "invalid-credential":
        return AuthFailure(locale.invalidCredential);
      case "account-exists-with-different-credential":
        return AuthFailure(locale.accountExistsWithDifferentCredential);
      case "requires-recent-login":
        return AuthFailure(locale.requiresRecentLogin);
      case "provider-already-linked":
        return AuthFailure(locale.providerAlreadyLinked);
      case "credential-already-in-use":
        return AuthFailure(locale.credentialAlreadyInUse);
      case "invalid-verification-code":
        return AuthFailure(locale.invalidVerificationCode);
      case "invalid-verification-id":
        return AuthFailure(locale.invalidVerificationId);
      default:
        return AuthFailure(locale.unknownAuthError);
    }
  }
}
