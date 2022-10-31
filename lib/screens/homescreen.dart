import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_docs_clone/colors.dart';
import 'package:google_docs_clone/repository/auth_repository.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  void signOut(WidgetRef ref) {
    ref.read(authRepositoryProvider).signOut();
    ref.read(userProvider.notifier).update((state) => null);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(backgroundColor: CWhitecolor, elevation: 0, actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: CBlackcolor,
            )),
        IconButton(
            onPressed: () =>signOut(ref),
            icon: const Icon(
              Icons.logout,
              color: CRedcolor,
            )),
      ]),
      body: Center(
        child: Text(
          ref.watch(userProvider)!.email,
        ),
      ),
    );
  }
}
