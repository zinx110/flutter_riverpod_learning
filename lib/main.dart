import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_learning/home_screen.dart';
import 'package:flutter_riverpod_learning/user.dart';

// final nameProvider = Provider<String>((ref) => "zinx");

// final nameProvider = StateProvider<String?>((ref) => null);

final userProvider =
    StateNotifierProvider<UserNotifier, User>((ref) => UserNotifier());

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
