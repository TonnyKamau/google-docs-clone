import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_docs_clone/colors.dart';
import 'package:google_docs_clone/repository/auth_repository.dart';
import 'package:google_docs_clone/screens/homescreen.dart';

class Login extends ConsumerWidget {
  const Login({super.key});
  void signInWithGoogle(WidgetRef ref, BuildContext context) async {
    final message = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final errorModel =
        await ref.read(authRepositoryProvider).signInWithGoogle();
    if (errorModel.error == null) {
      ref.read(userProvider.notifier).update((state) => errorModel.data);
      navigator.push(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      message.showSnackBar(
        SnackBar(
          content: Text(errorModel.error!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () => signInWithGoogle(ref, context),
          icon: Image.asset(
            'assets/images/g-logo-2.png',
            height: 20,
          ),
          label: const Text(
            'Sign in with google',
            style: TextStyle(
              color: CBlackcolor,
              fontFamily: 'Roboto',
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: CWhitecolor,
            minimumSize: const Size(150, 50),
          ),
        ),
      ),
    );
  }
}
