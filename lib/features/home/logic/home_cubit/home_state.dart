part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<Map<String, dynamic>> data;
  HomeSuccess(this.data);
}

class HomeFailure extends HomeState {
  final String message;
  HomeFailure(this.message);
}
