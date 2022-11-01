import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Document extends ConsumerStatefulWidget {
  final String id;
  const Document({Key? key, required this.id}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DocumentState();
}

class _DocumentState extends ConsumerState<Document> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(widget.id),),
    );
  }
}
