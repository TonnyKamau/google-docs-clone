import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
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
  final quill.QuillController _controller = quill.QuillController.basic();

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
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 9.0),
            child: Row(
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
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: cBluecolor,
                      )),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: cGreycolor,
                    width: 0.1,
                  ),
                ),
              )),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              quill.QuillToolbar.basic(controller: _controller),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: SizedBox(
                  width: 750,
                  child: Card(
                    elevation: 5,
                    color: cWhitecolor,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: quill.QuillEditor.basic(
                        controller: _controller,
                        readOnly: false, // true for view only mode
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
