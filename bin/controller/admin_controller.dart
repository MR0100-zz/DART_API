import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;

class AdminController {
  /// when user request with get and want to fetch admin details...
  static void getAdminDetails(HttpRequest _request) async {
    final targetFile = File(path.join(
        path.dirname(Platform.script.toFilePath()), 'admin_data.json'));

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
      _request.response.statusCode = HttpStatus.internalServerError;
    }
    await _request.response.close();
  }

  /// this api will call when user request to update admin details...
  static void updateAdminDetails(HttpRequest _request) async {
    try {
      _request.response.write(
        jsonEncode({
          'Method': 'POST',
          'Reason': 'User want to update admin details !'
        }),
      );
    } catch (e) {
      print('Something went wrong: $e');
      _request.response.statusCode = HttpStatus.internalServerError;
    }
    await _request.response.close();
  }

  /// method to chack request type...
  static void checkRequestType(HttpRequest _request) {
    switch (_request.method) {
      case 'GET':
        getAdminDetails(_request);
        break;
      case 'POST':
        updateAdminDetails(_request);
        break;
      default:
    }
  }
}
