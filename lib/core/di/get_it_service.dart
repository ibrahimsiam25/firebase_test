import 'package:get_it/get_it.dart';

import '../services/firebase_auth_service.dart';
import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/auth/logic/login_cubit/login_cubit.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Services
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());

  // Repos
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(firebaseAuthService: getIt.get<FirebaseAuthService>()),);

  // Cubits
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt.get<AuthRepo>()));
}
