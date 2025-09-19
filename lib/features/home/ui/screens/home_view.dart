import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/logic/home_cubit/home_cubit.dart';

class HomeView extends StatefulWidget {
  static const routeName = '/home';
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    // Delay fetch to next frame to avoid doing work during first build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<HomeCubit>().load('test_collection');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeFailure) {
            return Center(child: Text(state.message));
          } else if (state is HomeSuccess) {
            if (state.data.isEmpty) {
              return const Center(child: Text('لا توجد بيانات'));
            }
            return ListView.separated(
              itemCount: state.data.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final item = state.data[index];
                return ListTile(
                  title: Text(item['title']?.toString() ?? 'بدون عنوان'),
                  subtitle: Text(item['id']?.toString() ?? ''),
                );
              },
            );
          }
          return const Center(child: Text('ابدأ'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<HomeCubit>().load('test_collection'),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
