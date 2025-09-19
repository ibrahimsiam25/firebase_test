import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../auth/logic/login_cubit/login_cubit.dart';
import '../../../../home/ui/screens/home_view.dart';

class LoginView extends StatelessWidget {
  static const routeName = '/login';
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
            if (state is LoginSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'مرحبا ${state.user.name.isEmpty ? 'مستخدم' : state.user.name}',
                  ),
                ),
              );
              // Navigate to Home
              Navigator.of(context).pushReplacementNamed(HomeView.routeName);
            }
          },
          builder: (context, state) {
            if (state is LoginLoading) {
              return const CircularProgressIndicator();
            }
            return ElevatedButton.icon(
              onPressed: () {
                context.read<LoginCubit>().signInWithGoogle();
              },
              icon: const Icon(Icons.login),
              label: const Text('تسجيل الدخول عبر جوجل'),
            );
          },
        ),
      ),
    );
  }
}
