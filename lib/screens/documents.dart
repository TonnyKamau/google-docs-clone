import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_docs_clone/colors.dart';

class Document extends ConsumerStatefulWidget {
  final String id;
  const Document({Key? key, required this.id}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DocumentState();
}

class _DocumentState extends ConsumerState<Document> {
  TextEditingController titleController =
      TextEditingController(text: 'Untitled Document');

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cWhitecolor,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.lock,
                size: 16,
              ),
              label: const Text(
                'Share',
              ),
              style: ElevatedButton.styleFrom(backgroundColor: cBluecolor),
            ),
          )
        ],
        title: Row(
          children: [
            Image.asset(
              'assets/images/docs-logo.png',
              height: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 180,
              child: TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 10),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(widget.id),
      ),
    );
  }
}
