import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;

class UserController {
  /// ignore: always_declare_return_types
  static void userDetails(HttpRequest _request) async {
    final targetFile = File(path.join(
        path.dirname(Platform.script.toFilePath()), 'user_data.json'));

    final List<dynamic> _content;
    if (await targetFile.exists()) {
      _content = jsonDecode(targetFile.readAsStringSync());
    } else {
      print('Requested Data Not Exist!');
      exit(-1);
    }

    try {
      _request.response.write(
        jsonEncode(
          _content,
        ),
      );
    } catch (e) {
      print('Something went wrong: $e');
    }

    await _request.response.close();
  }
}
