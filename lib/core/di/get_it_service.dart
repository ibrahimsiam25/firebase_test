import 'package:get_it/get_it.dart';

import '../services/firebase_auth_service.dart';
import '../services/firestore_service.dart';
import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/auth/logic/login_cubit/login_cubit.dart';
import '../../features/home/data/repos/home_repo.dart';
import '../../features/home/logic/home_cubit/home_cubit.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Services
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<FireStoreService>(FireStoreService());

  // Repos
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(firebaseAuthService: getIt.get<FirebaseAuthService>()),
  );
  getIt.registerSingleton<HomeRepo>(
    HomeRepo(fireStoreService: getIt.get<FireStoreService>()),
  );

  // Cubits
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt.get<AuthRepo>()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt.get<HomeRepo>()));
}
