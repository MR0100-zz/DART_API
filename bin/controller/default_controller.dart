import 'dart:io';

class DefaultController {
  /// ignore: always_declare_return_types
  static void defaultPage(HttpRequest _request) async {
    try {
      _request.response.write('Welcome!\nYou are on the demo api.');
    } catch (e) {
      print('Something went wrong: $e');
      _request.response.statusCode = HttpStatus.internalServerError;
    }
    await _request.response.close();
  }
}
