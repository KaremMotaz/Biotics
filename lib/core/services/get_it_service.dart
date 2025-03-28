import 'package:biocode/core/repos/images_repo/images_repo.dart';
import 'package:biocode/core/repos/images_repo/images_repo_impl.dart';
import 'package:biocode/core/services/data_service.dart';
import 'package:biocode/core/services/firebase_auth_service.dart';
import 'package:biocode/core/services/firestore_service.dart';
import 'package:biocode/core/services/storage_service.dart';
import 'package:biocode/core/services/supabase_storage_service.dart';
import 'package:biocode/features/auth/data/repos/auth_repo_imp.dart';
import 'package:biocode/features/auth/domain/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FirestoreService());
  getIt.registerSingleton<StorageService>(SupabaseStorageService());

  getIt.registerSingleton<ImagesRepo>(
    ImagesRepoImpl(storageService: getIt<StorageService>()),
  );

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImp(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
}
