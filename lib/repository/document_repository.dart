import 'dart:convert';

import 'package:google_docs_clone/constant.dart';
import 'package:google_docs_clone/models/error_model.dart';
import 'package:http/http.dart';

class DocumentRepository {
  final Client _client;
  DocumentRepository({
    required Client client,
  }) : _client = client;
  Future<ErrorModel> createDocument(String token) async {
    ErrorModel error = ErrorModel(error: 'unexpectd error occured', data: null);
    try {
      var res = await _client.post(Uri.parse('$host/doc/create'),
          body: jsonEncode({
            'createdAt': DateTime.now().millisecondsSinceEpoch,
          }),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token,
          });
      switch (res.statusCode) {
        case 200:
          error = ErrorModel(error: null, data: '');
      }
    } catch (e) {}

    return error;
  }
}
