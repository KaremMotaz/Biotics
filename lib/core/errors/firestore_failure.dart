import 'package:biocode/core/errors/failure.dart';
import 'package:biocode/generated/l10n.dart';

class FirestoreFailure extends Failure {
  FirestoreFailure(super.errMessage);

  factory FirestoreFailure.fromCode(String code, S locale) {
    switch (code) {
      case "permission-denied":
        return FirestoreFailure(locale.permissionDenied);
      case "unavailable":
        return FirestoreFailure(locale.serviceUnavailable);
      case "deadline-exceeded":
        return FirestoreFailure(locale.deadlineExceeded);
      case "not-found":
        return FirestoreFailure(locale.documentNotFound);
      case "already-exists":
        return FirestoreFailure(locale.documentAlreadyExists);
      case "cancelled":
        return FirestoreFailure(locale.operationCancelled);
      case "invalid-argument":
        return FirestoreFailure(locale.invalidArgument);
      case "resource-exhausted":
        return FirestoreFailure(locale.resourceExhausted);
      case "failed-precondition":
        return FirestoreFailure(locale.failedPrecondition);
      case "aborted":
        return FirestoreFailure(locale.operationAborted);
      case "out-of-range":
        return FirestoreFailure(locale.outOfRange);
      case "data-loss":
        return FirestoreFailure(locale.dataLoss);
      case "unauthenticated":
        return FirestoreFailure(locale.unauthenticated);
      default:
        return FirestoreFailure(locale.unknownFirestoreError);
    }
  }
}
