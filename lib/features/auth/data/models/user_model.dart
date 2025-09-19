import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String name;
  final String email;
  final String uId;

  const UserModel({required this.name, required this.email, required this.uId});

  factory UserModel.fromFirebaseUser(User user) => UserModel(
    name: user.displayName ?? '',
    email: user.email ?? '',
    uId: user.uid,
  );

  Map<String, dynamic> toMap() => {'name': name, 'email': email, 'uId': uId};
}
