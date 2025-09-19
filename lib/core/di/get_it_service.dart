import 'package:get_it/get_it.dart';
import '../services/firebase_auth_service.dart';
import '../../features/auth/data/repos/auth_repo.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  if (!getIt.isRegistered<FirebaseAuthService>()) {
    getIt.registerLazySingleton<FirebaseAuthService>(
      () => FirebaseAuthService(),
    );
  }
  if (!getIt.isRegistered<AuthRepo>()) {
    getIt.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(firebaseAuthService: getIt<FirebaseAuthService>()),
    );
  }
}
