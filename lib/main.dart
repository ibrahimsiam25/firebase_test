import 'package:firebase_test/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/get_it_service.dart';
import 'features/auth/logic/login_cubit/login_cubit.dart';
import 'features/auth/ui/screens/login/login_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => LoginCubit(getIt()))],
      child: MaterialApp(
        title: 'Firebase Test',
        theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
        initialRoute: LoginView.routeName,
        routes: {LoginView.routeName: (_) => const LoginView()},
      ),
    );
  }
}
