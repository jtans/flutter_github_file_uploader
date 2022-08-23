library flutter_github_file_uploader;
import 'package:http/http.dart' as http;

class FlutterGithubFileUploader {
  upload({
    required String content,
    required String token,
  }) {
    http.put(Uri.https('authority', 'unencodedPath'));
  }
}
