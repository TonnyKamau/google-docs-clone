import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_docs_clone/colors.dart';
import 'package:google_docs_clone/repository/auth_repository.dart';

class Login extends ConsumerWidget {
  const Login({super.key});
  void signInWithGoogle(WidgetRef ref) {
    ref.read(authRepositoryProvider).signInWithGoogle();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          onPressed: ()=>signInWithGoogle(ref),
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
