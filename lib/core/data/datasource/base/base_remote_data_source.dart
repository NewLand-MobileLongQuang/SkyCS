import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:idnstd/core/errors/exceptions.dart';
import 'package:idnstd/core/utils/typedef.dart';
import 'package:idnstd/core/utils/uri_form.dart';

class BaseRemoteDataSource {
  const BaseRemoteDataSource(this._client);

  final http.Client _client;

  String get baseUrl => '';


  Map<String, String>? getHeaders() {
    return null;
  }

  Future<dynamic> doPostWithHeaders(
      {required String path,
      required Map<String, String> headers,
      DataMap? params}) async {
    try {
      final uri = UriForm.convertUri(url: baseUrl, path: path);
      final response = await _client.post(
          uri,
          headers: headers,
          body: params
      );
      // print("TrungLQ1: $uri");
      // print("TrungLQ2: $headers");
      // print("TrungLQ3: $params");
      if (response.statusCode == 200 || response.statusCode == 201) {
        // print("TrungLQ4: ${response.body}");
        return jsonDecode(response.body);
      } else {
        throw ApiException(
            Message: response.body, Code: response.statusCode.toString(),);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(Message: e.toString(), Code: '505');
    }
  }

  Future<dynamic> doPostWithHeadersAndFile(
      {required String path,
        required Map<String, String> headers,
        required String filePath,
        DataMap? params}) async {
    try {
      final uri = UriForm.convertUri(url: baseUrl, path: path);
      final request = http.MultipartRequest(
        'POST',
        uri,
      );
      request.headers.addAll(headers);
      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          filePath,
        ),
      );
      final response = await request.send();
      final responseStr = await response.stream.bytesToString();
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(responseStr);
      } else {
        throw ApiException(
          Message: response.toString(),
          Code: response.statusCode.toString(),
        );
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(Message: e.toString(), Code: '505');
    }
  }

  Future<dynamic> doPost({required String path, DataMap? params}) async {
    try {
      final uri = Uri.https(baseUrl, path);
      final response = await _client.post(uri,
          headers: getHeaders(),

          //body: jsonEncode({'email': email, 'password': password})
          body: params);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // throw ApiException(
        //     Message:response.body, Code: 'res.ErrorCode');
        return jsonDecode(response.body);
      } else {
        throw ApiException(
            Message: response.body, Code: response.statusCode.toString(),);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(Message: e.toString(), Code: '505');
    }
  }
}
