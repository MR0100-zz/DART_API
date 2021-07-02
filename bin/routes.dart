import 'dart:io';
import 'controller/admin_controller.dart';
import 'controller/default_controller.dart';
import 'controller/user_controller.dart';

class Routes {
  static const String _user = '/user';
  static const String _admin = '/admin';

  void handleRoutes(HttpRequest _request) async {
    print(_request.uri.path);
    _request.response.headers.contentType = ContentType.json;
    //CORS Header, so the anybody can use this
    _request.response.headers.add(
      'Access-Control-Allow-Origin',
      '*',
      preserveHeaderCase: true,
    );

    // ignore: omit_local_variable_types
    String _requestedRoute = _request.uri.path;

    switch (_requestedRoute) {
      case _user:
        UserController.userDetails(_request);
        break;
      case _admin:
        AdminController.checkRequestType(_request);
        break;
      default:
        DefaultController.defaultPage(_request);
    }
  }
}
