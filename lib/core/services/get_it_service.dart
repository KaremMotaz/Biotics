import 'package:biocode/core/services/firebase_auth_service.dart';
import 'package:biocode/features/auth/data/repos/auth_repo_imp.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());

  AuthRepoImp(
    firebaseAuthService: getIt<FirebaseAuthService>(),
  );
}
