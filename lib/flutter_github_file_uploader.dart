library flutter_github_file_uploader;

import 'dart:convert';

import 'package:http/http.dart' as http;

class FlutterGithubFileUploader {
  static Future<http.Response> upload({
    required String content,
    required String token,
    required String username,
    required String tag,
    String branch = 'main',
    String Function()? pathBuilder,
  }) async {
    final dateStr = DateTime.now().toIso8601String();
    var url = '';
    if (pathBuilder != null) {
      url += pathBuilder();
    } else {
      url += '/repos/$username/files/contents/logs/$tag/$dateStr.txt';
    }

    var body = {
      "message": dateStr,
      "committer": {"name": "amp", "email": "user@163.com"},
      "content": base64.encode(utf8.encode(content)),
      "branch": branch,
    };
    return http.put(Uri.https('api.github.com', url),
        headers: {
          'Authorization': 'token $token',
          // 'Content-Type': 'application/json',
          'accept': 'application/vnd.github.v3+json'
        },
        body: jsonEncode(body));
  }
}
